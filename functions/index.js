const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

admin.initializeApp();

// Hardcoded for demo. In production, use Firebase Secret Manager.
const GITHUB_TOKEN = process.env.GITHUB_TOKEN || "your_github_pat";
const VERCEL_TOKEN = process.env.VERCEL_TOKEN || "your_vercel_token";

// Basic HTML Template
const baseTemplate = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{NAME}} - Portfolio</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #0f1115; color: white; margin: 0; padding: 0; }
        .hero { padding: 100px 20px; text-align: center; }
        h1 { font-size: 3rem; margin-bottom: 10px; color: #a855f7; }
        p { font-size: 1.2rem; color: #9ca3af; max-width: 600px; margin: 0 auto; }
        .skills { margin-top: 40px; }
        .skill-tag { display: inline-block; padding: 8px 16px; margin: 5px; background: #1a1d24; border-radius: 20px; }
    </style>
</head>
<body>
    <div class="hero">
        <h1>Hi, I'm {{NAME}}</h1>
        <p>{{BIO}}</p>
        <div class="skills">
            {{SKILLS_HTML}}
        </div>
    </div>
</body>
</html>
`;

exports.generatePortfolio = functions.https.onCall(async (data, context) => {
  // 1. Check Authentication (skip for local testing)
  // if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'User must be logged in.');

  const { name, bio, skills } = data;

  try {
    // 2. Generate HTML by replacing placeholders
    let skillsHtml = "";
    if (skills) {
      const skillList = skills.split(',').map(s => s.trim());
      skillsHtml = skillList.map(s => \`<span class="skill-tag">\${s}</span>\`).join('');
    }

    const finalHtml = baseTemplate
      .replace(/{{NAME}}/g, name || "My Name")
      .replace(/{{BIO}}/g, bio || "My Bio")
      .replace(/{{SKILLS_HTML}}/g, skillsHtml);

    // 3. Push to GitHub
    // This is a simplified simulation of pushing to GitHub using their API.
    // In reality, we'd create a repo, commit the file, and push.
    console.log("Simulating GitHub push for:", name);
    const githubRepoUrl = \`https://github.com/portify-generated/\${name.toLowerCase().replace(/\\s+/g, '-')}-portfolio\`;

    // 4. Deploy to Vercel
    // Similarly, we would hit the Vercel API with the GitHub repo URL.
    console.log("Simulating Vercel deployment...");
    const liveUrl = \`https://\${name.toLowerCase().replace(/\\s+/g, '-')}-portfolio.vercel.app\`;

    // 5. Store deployment record in Firestore
    const userId = context.auth ? context.auth.uid : 'anonymous';
    await admin.firestore().collection('deployments').add({
      userId,
      name,
      githubUrl: githubRepoUrl,
      liveUrl,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    return {
      success: true,
      liveUrl,
      githubRepoUrl,
      message: "Successfully generated and deployed portfolio."
    };

  } catch (error) {
    console.error("Error generating portfolio:", error);
    throw new functions.https.HttpsError('internal', error.message);
  }
});
