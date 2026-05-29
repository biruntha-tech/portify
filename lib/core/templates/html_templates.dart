import 'portfolio_template.dart';

final List<PortfolioTemplate> appTemplates = [
  PortfolioTemplate(
    id: 'bento_box_modern',
    title: 'Modern Bento Box',
    type: 'Trendy Grid Layout',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} - Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&family=Space+Grotesk:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: ${primaryColor};
            --primary-glow: ${primaryColor}40;
            --bg: #07090e;
            --card-bg: rgba(18, 22, 33, 0.65);
            --card-border: rgba(255, 255, 255, 0.08);
            --text-primary: #f3f4f6;
            --text-secondary: #9ca3af;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--bg);
            background-image: 
                radial-gradient(at 0% 0%, var(--primary-glow) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(139, 92, 246, 0.1) 0px, transparent 50%);
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 3rem 1.5rem;
            overflow-x: hidden;
        }
        .container {
            max-width: 1100px;
            width: 100%;
            animation: fadeIn 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        .bento-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-auto-rows: minmax(180px, auto);
            gap: 1.25rem;
        }
        .bento-card {
            background: var(--card-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--card-border);
            border-radius: 28px;
            padding: 2rem;
            position: relative;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .bento-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: radial-gradient(800px circle at var(--x, 0px) var(--y, 0px), rgba(255,255,255,0.06), transparent 40%);
            border-radius: inherit;
            pointer-events: none;
            opacity: 0;
            transition: opacity 0.5s;
        }
        .bento-card:hover::before { opacity: 1; }
        .bento-card:hover {
            transform: translateY(-6px);
            border-color: var(--primary);
            box-shadow: 0 20px 40px -15px var(--primary-glow);
        }
        .profile-card {
            grid-column: span 2;
            grid-row: span 2;
            justify-content: center;
        }
        .profile-card h1 {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 3.5rem;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 1.25rem;
            letter-spacing: -0.03em;
        }
        .profile-card h1 span {
            background: linear-gradient(135deg, #fff, var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .profile-card p {
            font-size: 1.2rem;
            color: var(--text-secondary);
            line-height: 1.6;
            max-width: 90%;
        }
        .social-card {
            grid-column: span 1;
            grid-row: span 1;
            background: linear-gradient(135deg, var(--primary), rgba(255,255,255,0.05));
            border-color: rgba(255,255,255,0.1);
        }
        .social-card h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: white;
        }
        .social-links {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }
        .social-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0.85rem 1.25rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        .social-link:hover {
            background: white;
            color: black;
            transform: translateX(5px);
        }
        .skills-card {
            grid-column: span 1;
            grid-row: span 2;
        }
        .skills-card h3 {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 1.4rem;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .skills-card h3::before {
            content: '';
            width: 8px; height: 8px;
            background: var(--primary);
            border-radius: 50%;
            box-shadow: 0 0 10px var(--primary);
        }
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
            overflow-y: auto;
        }
        .skill-badge {
            padding: 0.6rem 1.1rem;
            background: rgba(255,255,255,0.03);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s;
        }
        .skill-badge:hover {
            background: var(--primary);
            border-color: transparent;
            box-shadow: 0 5px 15px var(--primary-glow);
            transform: translateY(-2px);
        }
        .projects-card {
            grid-column: span 2;
            grid-row: span 2;
        }
        .projects-card h3 {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 1.4rem;
            margin-bottom: 1.5rem;
        }
        .project-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }
        .project-item {
            padding: 1.25rem;
            background: rgba(255,255,255,0.02);
            border: 1px solid var(--card-border);
            border-radius: 20px;
            transition: all 0.3s;
        }
        .project-item:hover {
            border-color: var(--primary);
            background: rgba(255,255,255,0.04);
            transform: translateY(-3px);
        }
        .project-item h4 {
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            color: white;
        }
        .project-item p {
            font-size: 0.85rem;
            color: var(--text-secondary);
            line-height: 1.4;
        }
        .stats-card {
            grid-column: span 1;
            grid-row: span 1;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .stats-num {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 3rem;
            font-weight: 700;
            color: var(--primary);
            line-height: 1;
            margin-bottom: 0.25rem;
        }
        .stats-label {
            font-size: 0.8rem;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @media (max-width: 900px) {
            .bento-grid { grid-template-columns: 1fr; }
            .profile-card, .social-card, .skills-card, .projects-card, .stats-card {
                grid-column: span 1;
                grid-row: auto;
            }
            .profile-card h1 { font-size: 2.5rem; }
            .project-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="bento-grid">
            <div class="bento-card profile-card">
                <h1>Hi, I'm <br><span>${name}</span></h1>
                <p>${bio}</p>
            </div>
            
            <div class="bento-card social-card">
                <h3>Let's Connect</h3>
                <div class="social-links">
                    <a href="${githubUrl}" target="_blank" class="social-link">GitHub <span>↗</span></a>
                    <a href="${linkedinUrl}" target="_blank" class="social-link">LinkedIn <span>↗</span></a>
                </div>
            </div>
            
            <div class="bento-card skills-card">
                <h3>My Toolkit</h3>
                <div class="skills-container">
                    ${skills.split(',').map((s) => '<span class="skill-badge">${s.trim()}</span>').join('')}
                </div>
            </div>
            
            <div class="bento-card projects-card">
                <h3>Featured Work</h3>
                <div class="project-grid">
                    ${projects.split(',').map((p) => '<div class="project-item"><h4>${p.trim()}</h4><p>An outstanding solution created with clean code principles and modern architectures.</p></div>').join('')}
                </div>
            </div>

            <div class="bento-card stats-card">
                <div class="stats-num">100%</div>
                <div class="stats-label">Commitment</div>
            </div>
        </div>
    </div>

    <script>
        document.querySelectorAll('.bento-card').forEach(card => {
            card.addEventListener('mousemove', e => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                card.style.setProperty('--x', `\${x}px`);
                card.style.setProperty('--y', `\${y}px`);
            });
        });
    </script>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'developer_terminal_pro',
    title: 'Terminal Pro',
    type: 'Dark & Monospace',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} - Terminal</title>
    <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: ${primaryColor};
            --primary-glow: ${primaryColor}33;
            --bg: #090b10;
            --terminal-bg: #0d1017;
            --terminal-border: #21262d;
            --text-main: #c9d1d9;
            --text-accent: #58a6ff;
            --text-prompt: #2ea043;
        }
        
        .dracula {
            --bg: #1e1f29;
            --terminal-bg: #282a36;
            --terminal-border: #44475a;
            --text-main: #f8f8f2;
            --text-accent: #ff79c6;
            --text-prompt: #50fa7b;
        }

        .cyberpunk {
            --bg: #120424;
            --terminal-bg: #1a0836;
            --terminal-border: #ff007f;
            --text-main: #00ffff;
            --text-accent: #ff007f;
            --text-prompt: #ffff00;
        }
        
        .onedark {
            --bg: #1e222a;
            --terminal-bg: #21252b;
            --terminal-border: #3e4452;
            --text-main: #abb2bf;
            --text-accent: #61afef;
            --text-prompt: #98c379;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Fira Code', monospace;
            background-color: var(--bg);
            color: var(--text-main);
            min-height: 100vh;
            padding: 3rem 1.5rem;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s ease;
        }
        .terminal-window {
            width: 100%;
            max-width: 900px;
            background: var(--terminal-bg);
            border: 1px solid var(--terminal-border);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.6);
            display: flex;
            flex-direction: column;
            height: 600px;
        }
        .terminal-header {
            background: rgba(0, 0, 0, 0.3);
            padding: 0.75rem 1.25rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid var(--terminal-border);
            user-select: none;
        }
        .dots { display: flex; gap: 8px; }
        .dot { width: 12px; height: 12px; border-radius: 50%; }
        .dot.red { background: #ff5f56; }
        .dot.yellow { background: #ffbd2e; }
        .dot.green { background: #27c93f; }
        .terminal-tabs {
            display: flex;
            gap: 15px;
            margin-left: 20px;
            font-size: 0.85rem;
        }
        .theme-select {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--terminal-border);
            color: var(--text-main);
            font-family: inherit;
            padding: 2px 10px;
            border-radius: 6px;
            font-size: 0.8rem;
            cursor: pointer;
            outline: none;
        }
        .theme-select:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        .terminal-body {
            padding: 1.5rem;
            overflow-y: auto;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            scroll-behavior: smooth;
        }
        .command-block {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }
        .prompt-line {
            display: flex;
            align-items: center;
        }
        .prompt-symbol {
            color: var(--text-prompt);
            font-weight: bold;
            margin-right: 8px;
        }
        .cmd-text {
            color: #fff;
            font-weight: 600;
        }
        .cmd-output {
            padding-left: 1.5rem;
            color: var(--text-main);
            opacity: 0.95;
            white-space: pre-wrap;
            line-height: 1.6;
        }
        .skills-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin: 0.5rem 0;
        }
        .skill-tag {
            color: var(--text-accent);
            border: 1px dashed var(--text-accent);
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.9rem;
        }
        .project-block {
            border-left: 2px solid var(--terminal-border);
            padding-left: 12px;
            margin: 8px 0;
        }
        .project-block h4 {
            color: var(--text-accent);
            margin-bottom: 2px;
        }
        .link-item a {
            color: var(--primary);
            text-decoration: none;
            border-bottom: 1px dotted var(--primary);
        }
        .link-item a:hover {
            opacity: 0.8;
        }
        .interactive-line {
            display: flex;
            align-items: center;
            margin-top: auto;
            padding-top: 1rem;
        }
        .terminal-input {
            background: transparent;
            border: none;
            color: #fff;
            font-family: inherit;
            font-size: inherit;
            flex: 1;
            outline: none;
            caret-color: var(--primary);
        }
        .terminal-body::-webkit-scrollbar { width: 8px; }
        .terminal-body::-webkit-scrollbar-track { background: transparent; }
        .terminal-body::-webkit-scrollbar-thumb { background: var(--terminal-border); border-radius: 4px; }
    </style>
</head>
<body>
    <div class="terminal-window" id="terminal">
        <div class="terminal-header">
            <div style="display: flex; align-items: center;">
                <div class="dots"><div class="dot red"></div><div class="dot yellow"></div><div class="dot green"></div></div>
                <div class="terminal-tabs">guest@portify:~</div>
            </div>
            <select class="theme-select" id="theme-selector" onchange="changeTheme(this.value)">
                <option value="default">Default Dark</option>
                <option value="dracula">Dracula</option>
                <option value="onedark">One Dark</option>
                <option value="cyberpunk">Cyberpunk</option>
            </select>
        </div>
        <div class="terminal-body" id="history">
            <div class="command-block">
                <div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">whoami</span>
                </div>
                <div class="cmd-output" style="font-weight: bold; color: white;">${name}</div>
            </div>

            <div class="command-block">
                <div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">cat bio.txt</span>
                </div>
                <div class="cmd-output">${bio}</div>
            </div>

            <div class="command-block">
                <div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">ls skills/</span>
                </div>
                <div class="cmd-output">
                    <div class="skills-list">
                        ${skills.split(',').map((s) => '<span class="skill-tag">${s.trim()}</span>').join('')}
                    </div>
                </div>
            </div>

            <div class="command-block">
                <div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">tree projects/</span>
                </div>
                <div class="cmd-output">
                    ${projects.split(',').map((p) => '<div class="project-block"><h4>${p.trim()}</h4><p>Source files generated successfully. Deployed static assets to edge CDN.</p></div>').join('')}
                </div>
            </div>

            <div class="command-block">
                <div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">cat contact.json</span>
                </div>
                <div class="cmd-output">
                    <div class="link-item">GitHub: <a href="${githubUrl}" target="_blank">${githubUrl}</a></div>
                    <div class="link-item">LinkedIn: <a href="${linkedinUrl}" target="_blank">${linkedinUrl}</a></div>
                </div>
            </div>

            <div class="interactive-line" id="input-line">
                <span class="prompt-symbol">➜ ~</span>
                <input type="text" class="terminal-input" id="cli" autofocus placeholder="Type 'help' for commands..." onkeydown="handleCommand(event)">
            </div>
        </div>
    </div>

    <script>
        function changeTheme(theme) {
            const body = document.body;
            body.className = '';
            if (theme !== 'default') {
                body.classList.add(theme);
            }
        }

        const helpText = `Available commands:
  - whoami   : Display full name
  - bio      : Read about bio
  - skills   : List tech stack & tools
  - projects : Browse current projects
  - contact  : View external profile links
  - clear    : Clear terminal screen
  - help     : Print this directory`;

        function handleCommand(event) {
            if (event.key === 'Enter') {
                const input = document.getElementById('cli');
                const cmd = input.value.trim().toLowerCase();
                if (!cmd) return;

                const history = document.getElementById('history');
                const inputLine = document.getElementById('input-line');

                const block = document.createElement('div');
                block.className = 'command-block';
                block.innerHTML = \`<div class="prompt-line">
                    <span class="prompt-symbol">➜ ~</span>
                    <span class="cmd-text">\${input.value}</span>
                </div>\`;

                let output = '';
                if (cmd === 'help') {
                    output = \`<div class="cmd-output">\${helpText}</div>\`;
                } else if (cmd === 'whoami') {
                    output = \`<div class="cmd-output" style="font-weight: bold; color: white;">${name}</div>\`;
                } else if (cmd === 'bio') {
                    output = \`<div class="cmd-output">${bio}</div>\`;
                } else if (cmd === 'skills') {
                    output = \`<div class="cmd-output">
                        <div class="skills-list">
                            ${skills.split(',').map((s) => '<span class="skill-tag">${s.trim()}</span>').join('')}
                        </div>
                    </div>\`;
                } else if (cmd === 'projects') {
                    output = \`<div class="cmd-output">
                        ${projects.split(',').map((p) => '<div class="project-block"><h4>${p.trim()}</h4><p>Source files generated successfully. Deployed static assets to edge CDN.</p></div>').join('')}
                    </div>\`;
                } else if (cmd === 'contact') {
                    output = \`<div class="cmd-output">
                        <div class="link-item">GitHub: <a href="${githubUrl}" target="_blank">${githubUrl}</a></div>
                        <div class="link-item">LinkedIn: <a href="${linkedinUrl}" target="_blank">${linkedinUrl}</a></div>
                    </div>\`;
                } else if (cmd === 'clear') {
                    const blocks = history.querySelectorAll('.command-block');
                    blocks.forEach(b => b.remove());
                    input.value = '';
                    return;
                } else {
                    output = \`<div class="cmd-output" style="color: #ff5f56;">bash: command not found: \${cmd}. Type 'help' for options.</div>\`;
                }

                block.innerHTML += output;
                history.insertBefore(block, inputLine);
                input.value = '';
                history.scrollTop = history.scrollHeight;
            }
        }
        
        document.getElementById('terminal').addEventListener('click', () => {
            document.getElementById('cli').focus();
        });
    </script>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'creative_glass_pro',
    title: 'Aero Glass',
    type: 'Vibrant Glassmorphism',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Creative Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: ${primaryColor};
            --primary-glow: ${primaryColor}55;
            --bg-color: #0b0f19;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-color);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 4rem 1.5rem;
            overflow-x: hidden;
            position: relative;
        }
        
        .bg-orbs {
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            z-index: 1;
            overflow: hidden;
            pointer-events: none;
        }
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(120px);
            opacity: 0.35;
            animation: drift 20s infinite alternate ease-in-out;
        }
        .orb-1 {
            width: 450px; height: 450px;
            background: var(--primary);
            top: -100px; left: -100px;
        }
        .orb-2 {
            width: 500px; height: 500px;
            background: #ff007f;
            bottom: -150px; right: -50px;
            animation-duration: 25s;
            animation-delay: -5s;
        }
        .orb-3 {
            width: 300px; height: 300px;
            background: #00f0ff;
            top: 40%; left: 50%;
            animation-duration: 30s;
            animation-delay: -10s;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 36px;
            padding: 3.5rem;
            max-width: 900px;
            width: 100%;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
            position: relative;
            z-index: 10;
            transform-style: preserve-3d;
            transform: perspective(1000px);
            transition: transform 0.1s ease, box-shadow 0.3s;
        }
        .glass-card:hover {
            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.5), 0 0 40px var(--primary-glow);
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 3.5rem;
            transform: translateZ(50px);
        }
        h1 {
            font-size: 3.5rem;
            font-weight: 800;
            letter-spacing: -0.04em;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, #ffffff, var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .bio {
            font-size: 1.25rem;
            font-weight: 300;
            color: rgba(255, 255, 255, 0.75);
            max-width: 650px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            margin-bottom: 3.5rem;
            transform: translateZ(30px);
        }
        
        h2 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        h2::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, rgba(255,255,255,0.2), transparent);
        }
        
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .skill-pill {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.05);
            padding: 10px 22px;
            border-radius: 50px;
            font-size: 0.9rem;
            font-weight: 600;
            color: rgba(255,255,255,0.9);
            transition: all 0.3s;
        }
        .skill-pill:hover {
            background: var(--primary);
            border-color: transparent;
            box-shadow: 0 8px 20px var(--primary-glow);
            transform: translateY(-3px);
            color: #fff;
        }
        
        .projects-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .project-card {
            background: rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            padding: 20px;
            transition: all 0.3s;
        }
        .project-card:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
            transform: translateX(8px);
        }
        .project-card h3 {
            font-size: 1.15rem;
            margin-bottom: 6px;
            color: #fff;
        }
        .project-card p {
            font-size: 0.85rem;
            color: rgba(255,255,255,0.6);
            line-height: 1.4;
        }
        
        .actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            transform: translateZ(40px);
        }
        .btn {
            padding: 16px 36px;
            border-radius: 50px;
            text-decoration: none;
            color: white;
            font-weight: 600;
            transition: all 0.3s;
            letter-spacing: 0.5px;
            font-size: 0.95rem;
        }
        .btn-primary {
            background: var(--primary);
            box-shadow: 0 4px 15px var(--primary-glow);
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px var(--primary-glow);
            filter: brightness(1.15);
        }
        .btn-outline {
            background: transparent;
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
        }
        .btn-outline:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: white;
            transform: translateY(-3px);
        }
        
        @keyframes drift {
            0% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(60px, 40px) scale(1.1); }
            100% { transform: translate(-40px, -60px) scale(0.9); }
        }
        
        @media (max-width: 768px) {
            .content-grid { grid-template-columns: 1fr; gap: 2rem; }
            h1 { font-size: 2.5rem; }
            .glass-card { padding: 2rem; }
        }
    </style>
</head>
<body>
    <div class="bg-orbs">
        <div class="orb orb-1"></div>
        <div class="orb orb-2"></div>
        <div class="orb orb-3"></div>
    </div>
    
    <div class="glass-card" id="card">
        <div class="profile-header">
            <h1>${name}</h1>
            <p class="bio">${bio}</p>
        </div>
        
        <div class="content-grid">
            <div>
                <h2>Expertise</h2>
                <div class="skills-container">
                    ${skills.split(',').map((s) => '<div class="skill-pill">${s.trim()}</div>').join('')}
                </div>
            </div>
            
            <div>
                <h2>Recent Builds</h2>
                <div class="projects-list">
                    ${projects.split(',').map((p) => '<div class="project-card"><h3>${p.trim()}</h3><p>Full-stack architectural design focusing on scalability, security, and exceptional developer experience.</p></div>').join('')}
                </div>
            </div>
        </div>
        
        <div class="actions">
            <a href="${githubUrl}" class="btn btn-primary" target="_blank">Explore GitHub</a>
            <a href="${linkedinUrl}" class="btn btn-outline" target="_blank">Connect LinkedIn</a>
        </div>
    </div>

    <script>
        const card = document.getElementById('card');
        
        document.addEventListener('mousemove', (e) => {
            const xAxis = (window.innerWidth / 2 - e.pageX) / 30;
            const yAxis = (window.innerHeight / 2 - e.pageY) / 30;
            card.style.transform = `perspective(1000px) rotateY(\${xAxis}deg) rotateX(\${yAxis}deg)`;
        });
        
        document.addEventListener('mouseleave', () => {
            card.style.transform = 'perspective(1000px) rotateY(0deg) rotateX(0deg)';
            card.style.transition = 'all 0.5s ease';
        });
        
        document.addEventListener('mouseenter', () => {
            card.style.transition = 'none';
        });
    </script>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'clean_light_pro',
    title: 'Studio Clean',
    type: 'Minimal & Light',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Studio</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,700;0,900;1,400&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: ${primaryColor};
            --bg: #faf9f6;
            --text: #1a1a1a;
            --muted: #666666;
            --card-bg: #ffffff;
            --border: rgba(0,0,0,0.08);
        }
        
        .dark-mode {
            --bg: #0e0e0e;
            --text: #f5f5f5;
            --muted: #a0a0a0;
            --card-bg: #161616;
            --border: rgba(255,255,255,0.08);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; transition: background-color 0.3s ease, color 0.3s ease; }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.7;
            overflow-x: hidden;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 6rem 2rem;
        }
        
        .controls {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 4rem;
        }
        .theme-toggle {
            background: none;
            border: 1px solid var(--border);
            color: var(--text);
            padding: 8px 16px;
            border-radius: 30px;
            font-family: inherit;
            font-weight: 500;
            cursor: pointer;
            font-size: 0.85rem;
        }
        .theme-toggle:hover {
            border-color: var(--text);
        }

        header {
            margin-bottom: 7rem;
        }
        .intro-greeting {
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: block;
        }
        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 4.5rem;
            font-weight: 900;
            line-height: 1.1;
            margin-bottom: 2rem;
            letter-spacing: -0.02em;
        }
        h1 span {
            font-style: italic;
            font-weight: 400;
            color: var(--primary);
        }
        .bio {
            font-size: 1.5rem;
            font-weight: 300;
            color: var(--muted);
            max-width: 800px;
            line-height: 1.6;
        }
        
        .reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease-out;
        }
        .reveal.active {
            opacity: 1;
            transform: translateY(0);
        }
        
        .grid {
            display: grid;
            grid-template-columns: 1.2fr 1.8fr;
            gap: 5rem;
            margin-bottom: 8rem;
        }
        @media (max-width: 768px) {
            .grid { grid-template-columns: 1fr; gap: 3rem; }
            h1 { font-size: 3rem; }
            header { margin-bottom: 4rem; }
        }
        
        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 2rem;
            position: relative;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -5px; left: 0;
            width: 40px; height: 2px;
            background-color: var(--primary);
        }
        
        .skills-list {
            list-style: none;
        }
        .skills-list li {
            font-size: 1.15rem;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .skills-list li::after {
            content: '→';
            color: var(--primary);
            font-weight: bold;
            transition: transform 0.3s;
        }
        .skills-list li:hover::after {
            transform: translateX(5px);
        }
        
        .project-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            transition: all 0.3s ease;
        }
        .project-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.05);
            border-color: var(--primary);
        }
        .project-card h3 {
            font-family: 'Playfair Display', serif;
            font-size: 1.6rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }
        .project-card p {
            color: var(--muted);
            font-size: 0.95rem;
        }
        
        footer {
            border-top: 1px solid var(--border);
            padding-top: 4rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .social-links {
            display: flex;
            gap: 2rem;
        }
        .social-links a {
            color: var(--text);
            text-decoration: none;
            font-weight: 500;
            position: relative;
        }
        .social-links a::after {
            content: '';
            position: absolute;
            bottom: -2px; left: 0;
            width: 0; height: 1px;
            background: var(--primary);
            transition: width 0.3s ease;
        }
        .social-links a:hover::after {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="controls">
            <button class="theme-toggle" onclick="toggleDarkMode()">Switch Theme</button>
        </div>
        
        <header>
            <span class="intro-greeting">Creative Studio</span>
            <h1>I'm <span>${name}</span>.</h1>
            <p class="bio">${bio}</p>
        </header>
        
        <div class="grid">
            <section class="reveal">
                <h2 class="section-title">Avenue</h2>
                <ul class="skills-list">
                    ${skills.split(',').map((s) => '<li>${s.trim()}</li>').join('')}
                </ul>
            </section>
            
            <section class="reveal">
                <h2 class="section-title">Selected</h2>
                <div>
                    ${projects.split(',').map((p) => '<div class="project-card"><h3>${p.trim()}</h3><p>Detailed architecture study highlighting operational design and component strategy.</p></div>').join('')}
                </div>
            </section>
        </div>
        
        <footer class="reveal">
            <div>© ${DateTime.now().year} ${name}. All rights reserved.</div>
            <div class="social-links">
                <a href="${githubUrl}" target="_blank">GitHub</a>
                <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
            </div>
        </footer>
    </div>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
        }
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('active');
                }
            });
        }, { threshold: 0.1 });
        
        document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
        setTimeout(() => {
            document.querySelectorAll('.reveal').forEach(el => el.classList.add('active'));
        }, 100);
    </script>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'neumorphism_pro',
    title: 'Soft UI (Neumorphism)',
    type: 'Soft Shadows',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1558655146-d09347e92766?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #e0e5ec;
            --primary: ${primaryColor};
            --text: #4a5568;
            --title: #2d3748;
            --shadow-light: #ffffff;
            --shadow-dark: #a3b1c6;
            --shadow-light-inset: inset 4px 4px 8px #ffffff;
            --shadow-dark-inset: inset 4px 4px 8px #a3b1c6;
        }
        
        .dark-mode {
            --bg: #1e222b;
            --text: #a0aec0;
            --title: #f7fafc;
            --shadow-light: #2c313d;
            --shadow-dark: #101217;
            --shadow-light-inset: inset 4px 4px 8px #2c313d;
            --shadow-dark-inset: inset 4px 4px 8px #101217;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Nunito', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            padding: 4rem 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            transition: all 0.4s ease;
        }
        
        .theme-container {
            width: 100%;
            max-width: 800px;
            display: flex;
            justify-content: flex-end;
            margin-bottom: 2rem;
        }
        
        .neu-card {
            background: var(--bg);
            border-radius: 40px;
            box-shadow: 12px 12px 24px var(--shadow-dark), -12px -12px 24px var(--shadow-light);
            padding: 4rem 3rem;
            max-width: 800px;
            width: 100%;
            text-align: center;
            transition: all 0.4s ease;
        }
        
        .avatar-holder {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            margin: 0 auto 2.5rem;
            background: var(--bg);
            box-shadow: 9px 9px 18px var(--shadow-dark), -9px -9px 18px var(--shadow-light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3.5rem;
            font-weight: 800;
            color: var(--primary);
            transition: all 0.4s ease;
        }
        
        h1 {
            font-size: 2.75rem;
            margin: 0 0 1.25rem;
            color: var(--title);
            font-weight: 800;
        }
        .bio {
            font-size: 1.2rem;
            line-height: 1.6;
            margin-bottom: 2.5rem;
        }
        
        .neu-inner {
            background: var(--bg);
            border-radius: 24px;
            box-shadow: inset 5px 5px 10px var(--shadow-dark), inset -5px -5px 10px var(--shadow-light);
            padding: 2rem;
            margin-top: 2.5rem;
            text-align: left;
            transition: all 0.4s ease;
        }
        
        h2 {
            font-size: 1.4rem;
            color: var(--primary);
            margin: 0 0 1.5rem;
            font-weight: 700;
        }
        
        .pill-container {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        .neu-pill {
            background: var(--bg);
            border-radius: 50px;
            box-shadow: 4px 4px 8px var(--shadow-dark), -4px -4px 8px var(--shadow-light);
            padding: 10px 22px;
            font-weight: 700;
            font-size: 0.9rem;
            color: var(--text);
            transition: all 0.2s ease;
            cursor: default;
        }
        .neu-pill:hover {
            color: var(--primary);
            box-shadow: inset 2px 2px 5px var(--shadow-dark), inset -2px -2px 5px var(--shadow-light);
        }
        
        .project-item {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
            padding: 18px;
            border-radius: 20px;
            background: var(--bg);
            box-shadow: 4px 4px 8px var(--shadow-dark), -4px -4px 8px var(--shadow-light);
            transition: all 0.3s ease;
        }
        .project-item:hover {
            box-shadow: inset 3px 3px 6px var(--shadow-dark), inset -3px -3px 6px var(--shadow-light);
        }
        .project-icon {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: var(--bg);
            box-shadow: inset 3px 3px 6px var(--shadow-dark), inset -3px -3px 6px var(--shadow-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-weight: 800;
            font-size: 1.1rem;
        }
        .project-item h3 {
            margin: 0;
            font-size: 1.15rem;
            color: var(--title);
        }
        
        .neu-btn {
            display: inline-block;
            background: var(--bg);
            border-radius: 50px;
            box-shadow: 6px 6px 12px var(--shadow-dark), -6px -6px 12px var(--shadow-light);
            padding: 16px 36px;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
            margin: 0 10px;
            transition: all 0.2s ease;
        }
        .neu-btn:hover {
            color: var(--title);
        }
        .neu-btn:active {
            box-shadow: inset 4px 4px 8px var(--shadow-dark), inset -4px -4px 8px var(--shadow-light);
            transform: scale(0.98);
        }
        
        .btn-group {
            margin-top: 3rem;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }
    </style>
</head>
<body>
    <div class="theme-container">
        <a href="#" class="neu-btn" style="padding: 10px 20px; font-size: 0.85rem;" onclick="toggleTheme(event)">Switch Theme</a>
    </div>

    <div class="neu-card">
        <div class="avatar-holder">${name.substring(0, 1).toUpperCase()}</div>
        <h1>${name}</h1>
        <p class="bio">${bio}</p>
        
        <div class="neu-inner">
            <h2>Skills & Expertise</h2>
            <div class="pill-container">
                ${skills.split(',').map((s) => '<div class="neu-pill">${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="neu-inner">
            <h2>Featured Projects</h2>
            <div>
                ${projects.split(',').map((p) => '<div class="project-item"><div class="project-icon">✦</div><h3>${p.trim()}</h3></div>').join('')}
            </div>
        </div>
        
        <div class="btn-group">
            <a href="${githubUrl}" class="neu-btn" target="_blank">GitHub</a>
            <a href="${linkedinUrl}" class="neu-btn" target="_blank">LinkedIn</a>
        </div>
    </div>

    <script>
        function toggleTheme(e) {
            e.preventDefault();
            document.body.classList.toggle('dark-mode');
        }
    </script>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'retro_synthwave',
    title: 'Retro Synthwave 80s',
    type: 'Animated & Neon',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Retro 80s</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: ${primaryColor};
            --neon-pink: #ff2a6d;
            --neon-blue: #05d9e8;
            --neon-yellow: #fffa65;
            --bg-top: #0a0a2a;
            --bg-bottom: #2a0033;
        }
        
        * { box-sizing: border-box; margin: 0; padding: 0; }
        
        body {
            font-family: 'VT323', monospace;
            background: linear-gradient(180deg, var(--bg-top) 0%, var(--bg-bottom) 100%);
            color: #fff;
            min-height: 100vh;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 3rem 1.5rem;
            position: relative;
        }

        /* Animated Grid Background */
        .grid-bg {
            position: fixed;
            bottom: -50vh;
            left: -50vw;
            width: 200vw;
            height: 100vh;
            background-image: 
                linear-gradient(rgba(5, 217, 232, 0.4) 1px, transparent 1px),
                linear-gradient(90deg, rgba(5, 217, 232, 0.4) 1px, transparent 1px);
            background-size: 50px 50px;
            transform: perspective(500px) rotateX(60deg) translateY(100px) translateZ(200px);
            animation: gridMove 5s linear infinite;
            z-index: -1;
            box-shadow: inset 0 0 100px 50px var(--bg-bottom);
        }

        @keyframes gridMove {
            0% { transform: perspective(500px) rotateX(60deg) translateY(0) translateZ(200px); }
            100% { transform: perspective(500px) rotateX(60deg) translateY(50px) translateZ(200px); }
        }

        .sun {
            position: fixed;
            bottom: 30vh;
            left: 50%;
            transform: translateX(-50%);
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: linear-gradient(180deg, var(--neon-yellow) 0%, var(--neon-pink) 100%);
            box-shadow: 0 0 100px var(--neon-pink);
            z-index: -2;
            animation: pulseSun 4s infinite alternate;
        }

        @keyframes pulseSun {
            0% { box-shadow: 0 0 100px var(--neon-pink); }
            100% { box-shadow: 0 0 150px var(--neon-yellow); }
        }

        .content-wrapper {
            background: rgba(10, 10, 42, 0.85);
            backdrop-filter: blur(10px);
            border: 2px solid var(--neon-blue);
            box-shadow: 0 0 20px var(--neon-blue), inset 0 0 20px var(--neon-blue);
            border-radius: 10px;
            padding: 3rem;
            max-width: 800px;
            width: 100%;
            text-align: center;
            animation: flicker 0.15s infinite alternate;
        }

        h1 {
            font-family: 'Press Start 2P', cursive;
            font-size: 2.5rem;
            color: transparent;
            -webkit-text-stroke: 1px var(--neon-pink);
            text-shadow: 0 0 10px var(--neon-pink), 0 0 20px var(--neon-pink), 0 0 40px var(--neon-pink);
            margin-bottom: 2rem;
            line-height: 1.4;
        }

        .bio {
            font-size: 1.5rem;
            color: var(--neon-yellow);
            text-shadow: 0 0 5px var(--neon-yellow);
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        h2 {
            font-family: 'Press Start 2P', cursive;
            font-size: 1.2rem;
            color: var(--neon-blue);
            text-shadow: 0 0 10px var(--neon-blue);
            margin-bottom: 1.5rem;
            text-transform: uppercase;
        }

        .skills-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-bottom: 3rem;
        }

        .skill-tag {
            background: transparent;
            border: 2px solid var(--neon-yellow);
            color: var(--neon-yellow);
            padding: 10px 20px;
            font-size: 1.2rem;
            text-transform: uppercase;
            box-shadow: 0 0 10px var(--neon-yellow) inset, 0 0 10px var(--neon-yellow);
            transition: all 0.3s;
        }

        .skill-tag:hover {
            background: var(--neon-yellow);
            color: #000;
            box-shadow: 0 0 20px var(--neon-yellow) inset, 0 0 30px var(--neon-yellow);
            transform: scale(1.1);
        }

        .projects-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            margin-bottom: 3rem;
        }

        .project-card {
            border: 2px solid var(--neon-pink);
            padding: 20px;
            text-align: left;
            background: rgba(255, 42, 109, 0.1);
            box-shadow: inset 0 0 15px rgba(255, 42, 109, 0.3);
            transition: all 0.3s;
        }

        .project-card:hover {
            box-shadow: 0 0 20px var(--neon-pink), inset 0 0 20px var(--neon-pink);
            transform: translateX(10px);
        }

        .project-card h3 {
            font-size: 1.8rem;
            color: #fff;
            margin-bottom: 10px;
            text-shadow: 0 0 5px var(--neon-pink);
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 2rem;
        }

        .btn {
            font-family: 'Press Start 2P', cursive;
            font-size: 0.8rem;
            padding: 15px 25px;
            text-decoration: none;
            color: #000;
            background: var(--neon-blue);
            border: 2px solid #fff;
            box-shadow: 0 0 15px var(--neon-blue);
            transition: all 0.3s;
            text-transform: uppercase;
        }

        .btn:hover {
            background: #fff;
            color: var(--neon-blue);
            box-shadow: 0 0 25px #fff, 0 0 50px var(--neon-blue);
            transform: translateY(-5px);
        }
        
        .scanline {
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%), linear-gradient(90deg, rgba(255, 0, 0, 0.06), rgba(0, 255, 0, 0.02), rgba(0, 0, 255, 0.06));
            background-size: 100% 4px, 3px 100%;
            z-index: 100;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <div class="sun"></div>
    <div class="grid-bg"></div>
    <div class="scanline"></div>

    <div class="content-wrapper">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <h2>>> Skills</h2>
        <div class="skills-container">
            \${skills.split(',').map((s) => '<div class="skill-tag">\${s.trim()}</div>').join('')}
        </div>
        
        <h2>>> Projects</h2>
        <div class="projects-grid">
            \${projects.split(',').map((p) => '<div class="project-card"><h3>\${p.trim()}</h3><p>SYSTEM.OVERRIDE_SUCCESS: Project deployed to mainframe.</p></div>').join('')}
        </div>
        
        <div class="btn-group">
            <a href="\${githubUrl}" class="btn" target="_blank">GITHUB</a>
            <a href="\${linkedinUrl}" class="btn" target="_blank">LINKEDIN</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'matrix_hacker',
    title: 'Matrix Hacker',
    type: 'Animated Code Rain',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | The Matrix</title>
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --matrix-green: #00ff41;
            --matrix-dark: #003b00;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-color: #000;
            color: var(--matrix-green);
            font-family: 'Share Tech Mono', monospace;
            overflow-x: hidden;
            min-height: 100vh;
        }
        canvas {
            display: block;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1;
            opacity: 0.8;
        }
        .content-overlay {
            position: relative;
            z-index: 10;
            padding: 4rem 2rem;
            max-width: 900px;
            margin: 0 auto;
            background: rgba(0, 0, 0, 0.7);
            border: 1px solid var(--matrix-dark);
            box-shadow: 0 0 20px var(--matrix-dark);
            min-height: 100vh;
            backdrop-filter: blur(3px);
        }
        h1 {
            font-size: 4rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 1rem;
            text-shadow: 0 0 10px var(--matrix-green);
        }
        .bio {
            font-size: 1.5rem;
            line-height: 1.6;
            margin-bottom: 3rem;
            border-left: 4px solid var(--primary);
            padding-left: 1rem;
            background: rgba(0, 255, 65, 0.05);
        }
        h2 {
            font-size: 2rem;
            border-bottom: 2px solid var(--matrix-dark);
            padding-bottom: 10px;
            margin: 3rem 0 1.5rem;
        }
        .skills-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .skill-tag {
            background: #000;
            border: 1px solid var(--matrix-green);
            padding: 10px 20px;
            text-transform: uppercase;
            box-shadow: 0 0 5px var(--matrix-dark);
            transition: all 0.3s;
            cursor: crosshair;
        }
        .skill-tag:hover {
            background: var(--matrix-green);
            color: #000;
            box-shadow: 0 0 15px var(--matrix-green);
            transform: scale(1.05);
        }
        .project-block {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px dashed var(--matrix-green);
            background: rgba(0, 255, 65, 0.05);
            transition: all 0.3s;
        }
        .project-block:hover {
            background: rgba(0, 255, 65, 0.15);
            border-style: solid;
        }
        .project-block h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #fff;
            text-shadow: 0 0 5px var(--matrix-green);
        }
        .links {
            display: flex;
            gap: 20px;
            margin-top: 3rem;
        }
        .links a {
            color: #000;
            background: var(--matrix-green);
            padding: 15px 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            text-transform: uppercase;
            transition: all 0.3s;
        }
        .links a:hover {
            background: #fff;
            box-shadow: 0 0 20px #fff;
        }
    </style>
</head>
<body>
    <canvas id="matrix"></canvas>
    
    <div class="content-overlay">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <h2>System.Skills</h2>
        <div class="skills-grid">
            \${skills.split(',').map((s) => '<div class="skill-tag">\${s.trim()}</div>').join('')}
        </div>
        
        <h2>System.Projects</h2>
        <div>
            \${projects.split(',').map((p) => '<div class="project-block"><h3>\${p.trim()}</h3><p>Status: Deployed / Architecture: Optimal</p></div>').join('')}
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">Access GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">Access LinkedIn</a>
        </div>
    </div>

    <script>
        const canvas = document.getElementById('matrix');
        const ctx = canvas.getContext('2d');
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%^&*';
        const fontSize = 16;
        const columns = canvas.width / fontSize;
        const drops = Array.from({length: columns}).map(() => 1);

        function draw() {
            ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            ctx.fillStyle = getComputedStyle(document.documentElement).getPropertyValue('--matrix-green');
            ctx.font = fontSize + 'px monospace';

            for (let i = 0; i < drops.length; i++) {
                const text = letters[Math.floor(Math.random() * letters.length)];
                ctx.fillText(text, i * fontSize, drops[i] * fontSize);
                
                if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
                    drops[i] = 0;
                }
                drops[i]++;
            }
        }
        setInterval(draw, 33);
        
        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        });
    </script>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'executive_suite',
    title: 'Executive Suite',
    type: 'Corporate Minimal',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1497215728101-856f4ea42174?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} - Executive Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --text-dark: #2c3e50;
            --text-light: #7f8c8d;
            --bg-color: #f8f9fa;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-dark);
            line-height: 1.6;
        }
        .header {
            background-color: #ffffff;
            padding: 4rem 2rem;
            text-align: center;
            border-bottom: 4px solid var(--primary);
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        .header h1 {
            font-family: 'Merriweather', serif;
            font-size: 3.5rem;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }
        .header p {
            font-size: 1.2rem;
            color: var(--text-light);
            max-width: 800px;
            margin: 0 auto;
        }
        .container {
            max-width: 1000px;
            margin: 4rem auto;
            padding: 0 2rem;
        }
        .section-title {
            font-family: 'Merriweather', serif;
            font-size: 2rem;
            margin-bottom: 2rem;
            color: var(--text-dark);
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 0.5rem;
        }
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 4rem;
        }
        .skill-item {
            background: #ffffff;
            padding: 1rem;
            border-left: 4px solid var(--primary);
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            font-weight: 600;
        }
        .project-list {
            margin-bottom: 4rem;
        }
        .project-item {
            background: #ffffff;
            padding: 2rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            transition: transform 0.2s;
        }
        .project-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
        }
        .project-item h3 {
            font-family: 'Merriweather', serif;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        .contact {
            text-align: center;
            padding: 4rem 2rem;
            background-color: var(--text-dark);
            color: #ffffff;
        }
        .contact a {
            color: #ffffff;
            text-decoration: none;
            margin: 0 1rem;
            padding: 0.8rem 2rem;
            border: 2px solid #ffffff;
            border-radius: 30px;
            transition: all 0.3s;
        }
        .contact a:hover {
            background-color: var(--primary);
            border-color: var(--primary);
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>\${name}</h1>
        <p>\${bio}</p>
    </header>
    
    <div class="container">
        <h2 class="section-title">Core Competencies</h2>
        <div class="skills-grid">
            \${skills.split(',').map((s) => '<div class="skill-item">\${s.trim()}</div>').join('')}
        </div>
        
        <h2 class="section-title">Key Initiatives</h2>
        <div class="project-list">
            \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p>Successfully led development and deployment phases, ensuring robust architecture and adherence to corporate standards.</p></div>').join('')}
        </div>
    </div>
    
    <div class="contact">
        <h2 style="margin-bottom: 2rem; font-family: 'Merriweather', serif;">Connect</h2>
        <a href="\${linkedinUrl}" target="_blank">LinkedIn Profile</a>
        <a href="\${githubUrl}" target="_blank">GitHub Repository</a>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'consultant_pro',
    title: 'Consultant Pro',
    type: 'Sidebar Navigation',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Consulting</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Montserrat:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --sidebar-bg: #222222;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Lato', sans-serif;
            color: #333;
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 300px;
            background-color: var(--sidebar-bg);
            color: #fff;
            padding: 3rem 2rem;
            position: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .sidebar h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            line-height: 1.2;
        }
        .sidebar h1 span {
            color: var(--primary);
        }
        .sidebar p {
            color: #aaa;
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.5;
        }
        .sidebar-links {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        .sidebar-links a {
            color: #fff;
            text-decoration: none;
            font-family: 'Montserrat', sans-serif;
            font-size: 1.1rem;
            padding: 10px 0;
            border-bottom: 1px solid #444;
            transition: color 0.3s;
        }
        .sidebar-links a:hover {
            color: var(--primary);
            border-color: var(--primary);
        }
        .main-content {
            margin-left: 300px;
            padding: 5rem;
            flex: 1;
            background-color: #fafafa;
        }
        .section {
            margin-bottom: 5rem;
        }
        .section-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.2rem;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 10px;
        }
        .section-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 3px;
            background-color: var(--primary);
        }
        .skills-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .skill-chip {
            border: 1px solid #ccc;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 0.95rem;
            background: #fff;
            transition: all 0.3s;
        }
        .skill-chip:hover {
            border-color: var(--primary);
            color: var(--primary);
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .project-row {
            display: flex;
            background: #fff;
            border: 1px solid #eee;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .project-row:hover {
            transform: translateX(10px);
            border-left: 4px solid var(--primary);
        }
        .project-info {
            padding: 30px;
        }
        .project-info h3 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.4rem;
            margin-bottom: 10px;
        }
        @media (max-width: 900px) {
            body { flex-direction: column; }
            .sidebar { width: 100%; position: relative; height: auto; text-align: center; }
            .main-content { margin-left: 0; padding: 2rem; }
            .sidebar-links { align-items: center; }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h1>\${name.split(' ')[0]}<br><span>\${name.split(' ').skip(1).join(' ')}</span></h1>
        <p>\${bio}</p>
        <div class="sidebar-links">
            <a href="#expertise">Expertise</a>
            <a href="#projects">Case Studies</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
            <a href="\${githubUrl}" target="_blank">GitHub</a>
        </div>
    </div>
    
    <div class="main-content">
        <div class="section" id="expertise">
            <h2 class="section-title">Areas of Expertise</h2>
            <div class="skills-wrap">
                \${skills.split(',').map((s) => '<div class="skill-chip">\${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="section" id="projects">
            <h2 class="section-title">Recent Case Studies</h2>
            <div>
                \${projects.split(',').map((p) => '<div class="project-row"><div class="project-info"><h3>\${p.trim()}</h3><p>Consulted on architectural design and system implementation to optimize business workflows.</p></div></div>').join('')}
            </div>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'startup_pitch',
    title: 'Startup Pitch',
    type: 'Bold & Modern',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1559136555-9303baea8ebd?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --dark: #111111;
            --light: #f4f4f4;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
            color: var(--dark);
        }
        .hero {
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 10%;
            background: var(--dark);
            color: #fff;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 70%;
            height: 200%;
            background: var(--primary);
            transform: rotate(-15deg);
            z-index: 0;
            opacity: 0.9;
        }
        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 700px;
        }
        .hero h1 {
            font-size: 5rem;
            font-weight: 800;
            line-height: 1;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
        }
        .hero p {
            font-size: 1.5rem;
            opacity: 0.9;
            margin-bottom: 2rem;
        }
        .btn {
            display: inline-block;
            background: #fff;
            color: var(--dark);
            padding: 15px 40px;
            font-weight: 600;
            text-decoration: none;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        .container {
            padding: 5rem 10%;
        }
        .section-header {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 3rem;
            text-align: center;
        }
        .section-header span {
            color: var(--primary);
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }
        .card {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            text-align: center;
            transition: transform 0.3s;
            border-bottom: 5px solid transparent;
        }
        .card:hover {
            transform: translateY(-10px);
            border-color: var(--primary);
        }
        .card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .footer {
            background: var(--dark);
            color: #fff;
            text-align: center;
            padding: 3rem;
        }
        .footer a {
            color: var(--primary);
            text-decoration: none;
            margin: 0 10px;
            font-weight: 600;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="hero">
        <div class="hero-content">
            <h1>Hi, I'm <br>\${name}.</h1>
            <p>\${bio}</p>
            <a href="#projects" class="btn">View My Work</a>
        </div>
    </div>
    
    <div class="container" id="projects">
        <h2 class="section-header">My <span>Projects</span></h2>
        <div class="grid">
            \${projects.split(',').map((p) => '<div class="card"><h3>\${p.trim()}</h3><p>Innovative product built from the ground up focusing on user retention and scalable infrastructure.</p></div>').join('')}
        </div>
    </div>
    
    <div class="container" style="background-color: #fff;">
        <h2 class="section-header">Tech <span>Stack</span></h2>
        <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">
            \${skills.split(',').map((s) => '<span style="font-size: 1.2rem; font-weight: 600; background: var(--light); padding: 10px 25px; border-radius: 5px;">\${s.trim()}</span>').join('')}
        </div>
    </div>
    
    <div class="footer">
        <h2 style="margin-bottom: 20px;">Let's Build Something Great.</h2>
        <a href="\${githubUrl}" target="_blank">GitHub</a> | 
        <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'agency_dark',
    title: 'Agency Dark',
    type: 'Sleek Dark Mode',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1542744094-3a31f272c490?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Digital Agency</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&family=Inter:wght@300;400&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #0a0a0a;
            --surface: #1a1a1a;
            --text: #ffffff;
            --text-muted: #888888;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2rem 0;
            border-bottom: 1px solid #333;
            margin-bottom: 5rem;
        }
        .logo {
            font-family: 'Syne', sans-serif;
            font-size: 1.5rem;
            font-weight: 800;
            letter-spacing: -1px;
        }
        .nav-links a {
            color: var(--text);
            text-decoration: none;
            margin-left: 2rem;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .nav-links a:hover {
            color: var(--primary);
        }
        .hero-text {
            font-family: 'Syne', sans-serif;
            font-size: 5vw;
            font-weight: 800;
            line-height: 1;
            margin-bottom: 2rem;
            text-transform: uppercase;
        }
        .hero-text span {
            color: transparent;
            -webkit-text-stroke: 1px var(--text);
        }
        .hero-sub {
            font-size: 1.5rem;
            color: var(--text-muted);
            max-width: 600px;
            margin-bottom: 5rem;
        }
        .marquee {
            width: 100vw;
            margin-left: calc(-50vw + 50%);
            background: var(--primary);
            color: #000;
            padding: 1.5rem 0;
            overflow: hidden;
            white-space: nowrap;
            font-family: 'Syne', sans-serif;
            font-weight: 700;
            font-size: 1.2rem;
            text-transform: uppercase;
            margin-bottom: 5rem;
        }
        .marquee span {
            display: inline-block;
            padding-left: 100%;
            animation: marquee 20s linear infinite;
        }
        @keyframes marquee {
            0% { transform: translate(0, 0); }
            100% { transform: translate(-100%, 0); }
        }
        .grid-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
        }
        .project-item {
            position: relative;
            background: var(--surface);
            padding: 4rem 2rem;
            border: 1px solid #333;
            transition: all 0.5s;
        }
        .project-item:hover {
            background: var(--primary);
            color: #000;
            border-color: var(--primary);
        }
        .project-item h3 {
            font-family: 'Syne', sans-serif;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        @media (max-width: 768px) {
            .grid-layout { grid-template-columns: 1fr; }
            .hero-text { font-size: 3.5rem; }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">\${name}</div>
        <div class="nav-links">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </header>
    
    <div>
        <h1 class="hero-text">Digital <span>Experience</span><br>Creator.</h1>
        <p class="hero-sub">\${bio}</p>
    </div>
    
    <div class="marquee">
        <span>\${skills.split(',').join(' • ')} • \${skills.split(',').join(' • ')}</span>
    </div>
    
    <div class="grid-layout">
        \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p>Award-winning digital execution and strategy.</p></div>').join('')}
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'resume_classic',
    title: 'Classic Resume',
    type: 'Academic / Formal',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1586281380349-632531db7ed4?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Resume</title>
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
        }
        body {
            font-family: 'EB Garamond', serif;
            background: #e0e0e0;
            color: #000;
            margin: 0;
            padding: 2rem;
            display: flex;
            justify-content: center;
        }
        .page {
            background: #fff;
            width: 100%;
            max-width: 850px;
            padding: 3rem 4rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #000;
            padding-bottom: 1rem;
            margin-bottom: 1.5rem;
        }
        .header h1 {
            font-size: 2.5rem;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .contact-info {
            font-size: 1.1rem;
            margin-top: 0.5rem;
        }
        .contact-info a {
            color: #000;
            text-decoration: none;
            margin: 0 10px;
        }
        .section {
            margin-bottom: 1.5rem;
        }
        .section-title {
            text-transform: uppercase;
            font-size: 1.2rem;
            font-weight: 700;
            border-bottom: 1px solid #000;
            margin-bottom: 0.8rem;
            color: var(--primary);
        }
        .bio-text {
            font-size: 1.1rem;
            line-height: 1.5;
            text-align: justify;
        }
        .bullet-list {
            list-style-type: square;
            padding-left: 20px;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        .project-title {
            font-weight: 600;
            font-size: 1.15rem;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="page">
        <div class="header">
            <h1>\${name}</h1>
            <div class="contact-info">
                <a href="\${linkedinUrl}">LinkedIn</a> | 
                <a href="\${githubUrl}">GitHub</a>
            </div>
        </div>
        
        <div class="section">
            <div class="section-title">Summary</div>
            <p class="bio-text">\${bio}</p>
        </div>
        
        <div class="section">
            <div class="section-title">Technical Skills</div>
            <ul class="bullet-list">
                \${skills.split(',').map((s) => '<li>\${s.trim()}</li>').join('')}
            </ul>
        </div>
        
        <div class="section">
            <div class="section-title">Selected Projects</div>
            \${projects.split(',').map((p) => '<div class="project-title">\${p.trim()}</div><ul class="bullet-list"><li>Developed core functionality and architecture.</li><li>Implemented responsive design and integrated backend APIs.</li></ul>').join('')}
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'cyberpunk_2077',
    title: 'Cyberpunk 2077',
    type: 'Glitch & Neon',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1542831371-29b0f74f9713?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - CYBERPUNK</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700;900&family=Rajdhani:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --yellow: #fcee0a;
            --cyan: #00f0ff;
            --pink: #ff003c;
            --dark: #000000;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-color: var(--dark);
            color: var(--yellow);
            font-family: 'Rajdhani', sans-serif;
            overflow-x: hidden;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            position: relative;
        }
        .container::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(90deg, rgba(255,0,60,0.1) 0%, rgba(0,240,255,0.1) 100%);
            z-index: -1;
            pointer-events: none;
        }
        .glitch-wrapper {
            position: relative;
            margin-top: 10vh;
            margin-bottom: 3rem;
        }
        .glitch {
            font-family: 'Orbitron', sans-serif;
            font-size: 5rem;
            font-weight: 900;
            text-transform: uppercase;
            position: relative;
            color: var(--yellow);
            text-shadow: 2px 2px var(--cyan), -2px -2px var(--pink);
            animation: glitch 1s linear infinite;
        }
        @keyframes glitch {
            2%, 64% { transform: translate(2px,0) skew(0deg); }
            4%, 60% { transform: translate(-2px,0) skew(0deg); }
            62% { transform: translate(0,0) skew(5deg); }
        }
        .bio-box {
            background: rgba(0,240,255,0.1);
            border: 2px solid var(--cyan);
            padding: 2rem;
            font-size: 1.5rem;
            color: #fff;
            margin-bottom: 4rem;
            position: relative;
        }
        .bio-box::after {
            content: 'SYS.INFO';
            position: absolute;
            top: -15px;
            right: 20px;
            background: var(--dark);
            padding: 0 10px;
            color: var(--cyan);
            font-family: 'Orbitron', sans-serif;
        }
        .skills-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 4rem;
        }
        .skill-tag {
            background: var(--yellow);
            color: var(--dark);
            padding: 5px 20px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            text-transform: uppercase;
            clip-path: polygon(10% 0, 100% 0, 90% 100%, 0% 100%);
            transition: all 0.3s;
        }
        .skill-tag:hover {
            background: var(--cyan);
            transform: scale(1.1);
        }
        .project-block {
            border-left: 5px solid var(--pink);
            background: #111;
            padding: 2rem;
            margin-bottom: 2rem;
            color: #fff;
            transition: 0.3s;
        }
        .project-block:hover {
            background: #222;
            border-color: var(--cyan);
        }
        .project-block h3 {
            font-family: 'Orbitron', sans-serif;
            color: var(--yellow);
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }
        .btn-cyber {
            display: inline-block;
            background: var(--pink);
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            text-transform: uppercase;
            text-decoration: none;
            padding: 15px 40px;
            font-size: 1.2rem;
            font-weight: 700;
            border: none;
            cursor: pointer;
            position: relative;
            margin-right: 1rem;
            clip-path: polygon(0 0, 100% 0, 90% 100%, 0% 100%);
        }
        .btn-cyber:hover {
            background: var(--cyan);
            color: var(--dark);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="glitch-wrapper">
            <h1 class="glitch" data-text="\${name}">\${name}</h1>
        </div>
        
        <div class="bio-box">
            \${bio}
        </div>
        
        <h2 style="font-family: 'Orbitron'; font-size: 2rem; color: var(--pink); margin-bottom: 1rem;">// NEURAL UPGRADES</h2>
        <div class="skills-grid">
            \${skills.split(',').map((s) => '<div class="skill-tag">\${s.trim()}</div>').join('')}
        </div>
        
        <h2 style="font-family: 'Orbitron'; font-size: 2rem; color: var(--cyan); margin-bottom: 1rem;">// ACTIVE DIRECTIVES</h2>
        <div>
            \${projects.split(',').map((p) => '<div class="project-block"><h3>\${p.trim()}</h3><p>Status: OPERATIONAL. Objective completed with optimal efficiency.</p></div>').join('')}
        </div>
        
        <div style="margin-top: 4rem;">
            <a href="\${githubUrl}" class="btn-cyber" target="_blank">GITHUB LINK</a>
            <a href="\${linkedinUrl}" class="btn-cyber" target="_blank" style="background: var(--cyan); color: var(--dark);">LINKEDIN LINK</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'galaxy_particles',
    title: 'Galaxy Particles',
    type: 'Interactive Canvas',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Galaxy</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
        }
        body, html {
            margin: 0; padding: 0; width: 100%; height: 100%;
            background: #050505; color: #fff;
            font-family: 'Quicksand', sans-serif;
            overflow-x: hidden;
        }
        #canvas {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: 0;
        }
        .content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 5rem 2rem;
            text-align: center;
            background: linear-gradient(to bottom, rgba(5,5,5,0) 0%, rgba(5,5,5,0.8) 100%);
            min-height: 100vh;
        }
        h1 {
            font-size: 4rem;
            letter-spacing: 5px;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(255,255,255,0.5);
        }
        .bio {
            font-size: 1.5rem;
            font-weight: 300;
            max-width: 800px;
            margin-bottom: 4rem;
            line-height: 1.6;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 3rem;
            border-radius: 20px;
            max-width: 900px;
            width: 100%;
            margin-bottom: 3rem;
        }
        h2 {
            font-size: 2rem;
            margin-bottom: 2rem;
            color: var(--primary);
        }
        .skills {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .skill {
            background: rgba(255,255,255,0.1);
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 1.1rem;
            transition: 0.3s;
        }
        .skill:hover {
            background: var(--primary);
            box-shadow: 0 0 15px var(--primary);
        }
        .projects {
            text-align: left;
        }
        .project {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .project h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        .links a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem;
            margin: 0 15px;
            border-bottom: 2px solid transparent;
            transition: 0.3s;
        }
        .links a:hover {
            color: var(--primary);
            border-color: var(--primary);
        }
    </style>
</head>
<body>
    <canvas id="canvas"></canvas>
    <div class="content">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <div class="glass-panel">
            <h2>Constellation of Skills</h2>
            <div class="skills">
                \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="glass-panel projects">
            <h2 style="text-align: center;">Missions Accomplished</h2>
            \${projects.split(',').map((p) => '<div class="project"><h3>\${p.trim()}</h3><p>Successfully charted new territories in development, delivering robust and scalable solutions.</p></div>').join('')}
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>

    <script>
        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');
        let width = canvas.width = window.innerWidth;
        let height = canvas.height = window.innerHeight;
        let particles = [];
        const mouse = { x: null, y: null, radius: 150 };

        window.addEventListener('mousemove', (e) => {
            mouse.x = e.x;
            mouse.y = e.y;
        });

        class Particle {
            constructor() {
                this.x = Math.random() * width;
                this.y = Math.random() * height;
                this.size = Math.random() * 2 + 0.1;
                this.baseX = this.x;
                this.baseY = this.y;
                this.density = (Math.random() * 30) + 1;
            }
            draw() {
                ctx.fillStyle = 'rgba(255,255,255,0.8)';
                ctx.beginPath();
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.closePath();
                ctx.fill();
            }
            update() {
                let dx = mouse.x - this.x;
                let dy = mouse.y - this.y;
                let distance = Math.sqrt(dx * dx + dy * dy);
                let forceDirectionX = dx / distance;
                let forceDirectionY = dy / distance;
                let maxDistance = mouse.radius;
                let force = (maxDistance - distance) / maxDistance;
                let directionX = forceDirectionX * force * this.density;
                let directionY = forceDirectionY * force * this.density;

                if (distance < mouse.radius) {
                    this.x -= directionX;
                    this.y -= directionY;
                } else {
                    if (this.x !== this.baseX) {
                        let dx = this.x - this.baseX;
                        this.x -= dx / 10;
                    }
                    if (this.y !== this.baseY) {
                        let dy = this.y - this.baseY;
                        this.y -= dy / 10;
                    }
                }
            }
        }

        function init() {
            particles = [];
            for (let i = 0; i < 500; i++) {
                particles.push(new Particle());
            }
        }

        function animate() {
            ctx.clearRect(0, 0, width, height);
            for (let i = 0; i < particles.length; i++) {
                particles[i].draw();
                particles[i].update();
            }
            requestAnimationFrame(animate);
        }

        init();
        animate();

        window.addEventListener('resize', () => {
            width = canvas.width = window.innerWidth;
            height = canvas.height = window.innerHeight;
            init();
        });
    </script>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'liquid_gradient',
    title: 'Liquid Gradient',
    type: 'Morphing Blobs',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;600;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Outfit', sans-serif;
            background: #fff;
            color: #111;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }
        /* Background Blobs */
        .blob {
            position: fixed;
            filter: blur(80px);
            z-index: 0;
            opacity: 0.6;
            border-radius: 50%;
            animation: moveBlobs 20s infinite alternate cubic-bezier(0.4, 0, 0.2, 1);
        }
        .blob1 {
            top: -10%; left: -10%;
            width: 50vw; height: 50vw;
            background: var(--primary);
        }
        .blob2 {
            bottom: -20%; right: -10%;
            width: 60vw; height: 60vw;
            background: #ff7eb3;
            animation-delay: -5s;
        }
        .blob3 {
            top: 30%; left: 30%;
            width: 40vw; height: 40vw;
            background: #7afcff;
            animation-delay: -10s;
        }
        @keyframes moveBlobs {
            0% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(10vw, 15vh) scale(1.1); }
            100% { transform: translate(-15vw, 5vh) scale(0.9); }
        }
        
        /* Content overlay */
        .glass-container {
            position: relative;
            z-index: 10;
            background: rgba(255, 255, 255, 0.4);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-right: 1px solid rgba(255,255,255,0.2);
            border-bottom: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 25px 45px rgba(0,0,0,0.1);
            max-width: 1000px;
            margin: 5rem auto;
            padding: 4rem;
            border-radius: 30px;
        }
        h1 {
            font-size: 5rem;
            font-weight: 900;
            line-height: 1;
            margin-bottom: 1.5rem;
            background: linear-gradient(45deg, #111, var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .bio {
            font-size: 1.5rem;
            font-weight: 300;
            line-height: 1.6;
            margin-bottom: 3rem;
            color: #333;
        }
        .section-title {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            margin-top: 3rem;
        }
        .pill-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .pill {
            background: rgba(255,255,255,0.6);
            border: 1px solid rgba(255,255,255,0.8);
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
            transition: 0.3s;
        }
        .pill:hover {
            background: #fff;
            transform: translateY(-3px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.05);
        }
        .project-card {
            background: rgba(255,255,255,0.5);
            padding: 2rem;
            border-radius: 20px;
            margin-bottom: 1.5rem;
            transition: 0.3s;
        }
        .project-card:hover {
            background: #fff;
            transform: translateY(-5px);
        }
        .project-card h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        .socials {
            display: flex;
            gap: 20px;
            margin-top: 4rem;
        }
        .socials a {
            display: inline-block;
            text-decoration: none;
            color: #111;
            font-weight: 600;
            font-size: 1.2rem;
            background: #fff;
            padding: 15px 30px;
            border-radius: 50px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            transition: 0.3s;
        }
        .socials a:hover {
            background: var(--primary);
            color: #fff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="blob blob1"></div>
    <div class="blob blob2"></div>
    <div class="blob blob3"></div>
    
    <div class="glass-container">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <h2 class="section-title">Skills & Toolkit</h2>
        <div class="pill-container">
            \${skills.split(',').map((s) => '<div class="pill">\${s.trim()}</div>').join('')}
        </div>
        
        <h2 class="section-title">Featured Work</h2>
        <div>
            \${projects.split(',').map((p) => '<div class="project-card"><h3>\${p.trim()}</h3><p>A beautifully crafted digital experience merging form and function.</p></div>').join('')}
        </div>
        
        <div class="socials">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'typewriter_terminal',
    title: 'Typewriter Terminal',
    type: 'Typing Effect',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Terminal</title>
    <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #1e1e1e;
            --text: #c5c8c6;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-color: var(--bg);
            color: var(--text);
            font-family: 'Fira Code', monospace;
            padding: 2rem;
            line-height: 1.5;
        }
        .window {
            max-width: 900px;
            margin: 0 auto;
            background: #2d2d2d;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
        }
        .title-bar {
            background: #3d3d3d;
            padding: 10px 15px;
            display: flex;
            align-items: center;
        }
        .buttons {
            display: flex;
            gap: 8px;
        }
        .btn {
            width: 12px; height: 12px; border-radius: 50%;
        }
        .close { background: #ff5f56; }
        .min { background: #ffbd2e; }
        .max { background: #27c93f; }
        .title {
            color: #999;
            margin-left: 20px;
            font-size: 0.9rem;
        }
        .content {
            padding: 30px;
            min-height: 500px;
        }
        .prompt::before {
            content: '~\$ ';
            color: var(--primary);
            font-weight: bold;
        }
        .line {
            margin-bottom: 10px;
            white-space: pre-wrap;
        }
        .typing {
            overflow: hidden;
            white-space: nowrap;
            border-right: 2px solid transparent;
        }
        .cmd { color: #fff; font-weight: 600; }
        .output { color: #8abeb7; margin-left: 20px; margin-bottom: 20px; }
        .output-highlight { color: #f0c674; }
        a { color: #81a2be; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="window">
        <div class="title-bar">
            <div class="buttons">
                <div class="btn close"></div>
                <div class="btn min"></div>
                <div class="btn max"></div>
            </div>
            <div class="title">bash - \${name.toLowerCase().replace(' ', '_')} - 80x24</div>
        </div>
        <div class="content" id="terminal-content">
            <!-- Content will be injected by JS -->
        </div>
    </div>

    <script>
        const content = [
            { cmd: "whoami", out: "\${name}" },
            { cmd: "cat bio.txt", out: "\${bio}" },
            { cmd: "ls ./skills", out: "\${skills.split(',').map(s => `<span class='output-highlight'>\${s.trim()}</span>`).join('  ')}" },
            { cmd: "ls ./projects", out: "\${projects.split(',').map(p => `• \${p.trim()}`).join('<br>')}" },
            { cmd: "cat contact.json", out: `{\n  "github": "<a href='\${githubUrl}' target='_blank'>\${githubUrl}</a>",\n  "linkedin": "<a href='\${linkedinUrl}' target='_blank'>\${linkedinUrl}</a>"\n}` }
        ];

        const term = document.getElementById('terminal-content');
        let index = 0;

        async function typeLine(text, isCmd = false) {
            const div = document.createElement('div');
            div.className = isCmd ? 'line prompt cmd' : 'line output';
            term.appendChild(div);
            
            if (isCmd) {
                for (let i = 0; i < text.length; i++) {
                    div.innerHTML += text.charAt(i);
                    await new Promise(r => setTimeout(r, 50));
                }
                await new Promise(r => setTimeout(r, 200));
            } else {
                div.innerHTML = text;
                await new Promise(r => setTimeout(r, 500));
            }
            
            window.scrollTo(0, document.body.scrollHeight);
        }

        async function runTerminal() {
            for (let item of content) {
                await typeLine(item.cmd, true);
                await typeLine(item.out, false);
            }
            const cursor = document.createElement('div');
            cursor.className = 'line prompt';
            cursor.innerHTML = '<span style="animation: blink 1s infinite;">█</span>';
            term.appendChild(cursor);
        }

        document.head.insertAdjacentHTML("beforeend", `<style>@keyframes blink { 50% { opacity: 0; } }</style>`);
        runTerminal();
    </script>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'parallax_mountain',
    title: 'Parallax Mountain',
    type: '3D Scroll',
    category: 'Animated',
    imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Parallax</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body, html {
            height: 100%;
            font-family: 'Roboto', sans-serif;
            overflow-x: hidden;
            background: #111;
            color: #fff;
        }
        .parallax-wrapper {
            height: 100vh;
            overflow-x: hidden;
            overflow-y: auto;
            perspective: 300px;
        }
        .parallax-group {
            position: relative;
            height: 100vh;
            transform-style: preserve-3d;
        }
        .parallax-layer {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .bg-layer {
            transform: translateZ(-300px) scale(2);
            background: url('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=1920&q=80') center center / cover;
            z-index: 1;
        }
        .bg-layer::after {
            content: '';
            position: absolute;
            top:0; left:0; width:100%; height:100%;
            background: rgba(0,0,0,0.6);
        }
        .title-layer {
            transform: translateZ(0);
            z-index: 2;
            text-align: center;
        }
        h1 {
            font-family: 'Oswald', sans-serif;
            font-size: 8rem;
            text-transform: uppercase;
            letter-spacing: 10px;
            color: #fff;
            text-shadow: 0 10px 30px rgba(0,0,0,0.8);
        }
        .content-group {
            background: #111;
            position: relative;
            z-index: 3;
            padding: 5rem 10%;
        }
        .bio {
            font-size: 1.5rem;
            line-height: 1.8;
            max-width: 800px;
            margin: 0 auto 5rem;
            text-align: center;
            font-weight: 300;
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            font-size: 3rem;
            margin-bottom: 2rem;
            color: var(--primary);
            text-transform: uppercase;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 5rem;
        }
        .card {
            background: #222;
            padding: 2rem;
            border-top: 4px solid var(--primary);
        }
        .card h3 {
            font-family: 'Oswald', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 5rem;
        }
        .tag {
            background: rgba(255,255,255,0.1);
            padding: 8px 20px;
            font-size: 1.1rem;
            border-radius: 4px;
        }
        .footer {
            text-align: center;
            padding: 2rem 0;
            border-top: 1px solid #333;
        }
        .footer a {
            color: var(--primary);
            text-decoration: none;
            font-size: 1.2rem;
            margin: 0 15px;
            font-family: 'Oswald', sans-serif;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="parallax-wrapper">
        <div class="parallax-group">
            <div class="parallax-layer bg-layer"></div>
            <div class="parallax-layer title-layer">
                <h1>\${name}</h1>
            </div>
        </div>
        
        <div class="content-group">
            <p class="bio">\${bio}</p>
            
            <h2>Skills</h2>
            <div class="tags">
                \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
            </div>
            
            <h2>Projects</h2>
            <div class="grid">
                \${projects.split(',').map((p) => '<div class="card"><h3>\${p.trim()}</h3><p>Engineered and deployed successfully.</p></div>').join('')}
            </div>
            
            <div class="footer">
                <a href="\${githubUrl}" target="_blank">GitHub</a>
                <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
            </div>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'retro_arcade',
    title: 'Retro Arcade',
    type: '8-Bit Gaming',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Player 1</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #0a0a2a;
            --text: #ffffff;
            --highlight: #ff0055;
            --cyan: #00f0ff;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-color: var(--bg);
            color: var(--text);
            font-family: 'Press Start 2P', cursive;
            line-height: 1.8;
            padding: 2rem;
            text-transform: uppercase;
            overflow-x: hidden;
        }
        body::after {
            content: "";
            position: fixed;
            top: 0; left: 0; width: 100vw; height: 100vh;
            background: repeating-linear-gradient(0deg, rgba(0,0,0,0.15), rgba(0,0,0,0.15) 1px, transparent 1px, transparent 2px);
            pointer-events: none;
            z-index: 100;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            border: 4px solid var(--cyan);
            padding: 3rem;
            background: rgba(0, 0, 0, 0.8);
            box-shadow: 0 0 20px var(--cyan), inset 0 0 20px var(--cyan);
            position: relative;
        }
        .scanlines {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(to bottom, rgba(255,255,255,0), rgba(255,255,255,0) 50%, rgba(0,0,0,0.1) 50%, rgba(0,0,0,0.1));
            background-size: 100% 4px;
            pointer-events: none;
            z-index: 50;
        }
        h1 {
            color: var(--highlight);
            text-shadow: 4px 4px 0 #000, -2px -2px 0 var(--cyan);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); text-shadow: 4px 4px 0 #000, -2px -2px 10px var(--cyan); }
            100% { transform: scale(1); }
        }
        .bio {
            font-size: 0.9rem;
            margin-bottom: 3rem;
            color: #ffff00;
            line-height: 2;
        }
        .section-title {
            color: var(--cyan);
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
            border-bottom: 4px dashed var(--cyan);
            padding-bottom: 10px;
            display: inline-block;
        }
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 3rem;
        }
        .skill {
            background: transparent;
            color: var(--cyan);
            padding: 15px;
            text-align: center;
            border: 4px solid var(--cyan);
            font-size: 0.8rem;
            transition: 0.2s;
        }
        .skill:hover {
            background: var(--cyan);
            color: #000;
            transform: translateY(-5px);
            box-shadow: 0 10px 0 #005555;
        }
        .project {
            margin-bottom: 2rem;
            padding: 2rem;
            border: 4px dotted var(--highlight);
            background: rgba(255,0,85,0.1);
            transition: 0.3s;
        }
        .project:hover {
            border-style: solid;
            background: rgba(255,0,85,0.2);
        }
        .project h3 {
            color: var(--primary);
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }
        .links {
            text-align: center;
            margin-top: 4rem;
        }
        .links a {
            color: #fff;
            text-decoration: none;
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            background: var(--highlight);
            border: 4px solid #fff;
            font-size: 0.9rem;
            transition: 0.2s;
        }
        .links a:hover {
            background: #fff;
            color: var(--highlight);
            border-color: var(--highlight);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="scanlines"></div>
        <h1>PLAYER 1:\n\${name}</h1>
        <p class="bio">> \${bio}<span style="animation: blink 1s infinite;">_</span></p>
        <style>@keyframes blink { 50% { opacity: 0; } }</style>
        
        <div class="section-title">INVENTORY</div>
        <div class="skills-grid">
            \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
        </div>
        
        <div class="section-title">QUESTS COMPLETED</div>
        <div>
            \${projects.split(',').map((p) => '<div class="project"><h3>\${p.trim()}</h3><p style="font-size:0.8rem; color:#ccc;">SCORE: 99999<br>STATUS: CLEARED</p></div>').join('')}
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">GITHUB (START)</a>
            <a href="\${linkedinUrl}" target="_blank">LINKEDIN (SELECT)</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'pop_art',
    title: 'Pop Art',
    type: 'Comic Book Style',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1574169208507-84376144848b?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | POW!</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --yellow: #ffd900;
            --blue: #00a2ff;
            --red: #ff3333;
            --black: #111;
        }
        body {
            background-color: var(--yellow);
            background-image: radial-gradient(var(--red) 15%, transparent 16%), radial-gradient(var(--red) 15%, transparent 16%);
            background-size: 30px 30px;
            background-position: 0 0, 15px 15px;
            font-family: 'Comic Neue', cursive;
            color: var(--black);
            margin: 0; padding: 2rem;
            animation: bgScroll 10s linear infinite;
        }
        @keyframes bgScroll {
            0% { background-position: 0 0, 15px 15px; }
            100% { background-position: 30px 30px, 45px 45px; }
        }
        .comic-panel {
            background: #fff;
            border: 8px solid var(--black);
            box-shadow: 15px 15px 0 var(--blue);
            max-width: 1000px;
            margin: 0 auto 3rem;
            padding: 3rem;
            position: relative;
            transform: rotate(-1deg);
            transition: 0.3s;
        }
        .comic-panel:hover {
            transform: rotate(0deg) scale(1.02);
            box-shadow: 20px 20px 0 var(--blue);
        }
        h1 {
            font-family: 'Bangers', cursive;
            font-size: 6rem;
            color: var(--red);
            text-shadow: 4px 4px 0 var(--black), 8px 8px 0 #fff;
            margin-bottom: 1rem;
            transform: rotate(-3deg);
            display: inline-block;
        }
        .bio {
            font-size: 1.5rem;
            background: var(--blue);
            color: #fff;
            padding: 20px;
            border: 5px solid var(--black);
            border-radius: 20px;
            margin-bottom: 2rem;
            box-shadow: 8px 8px 0 var(--black);
        }
        .title {
            font-family: 'Bangers', cursive;
            font-size: 3rem;
            color: var(--primary);
            text-shadow: 2px 2px 0 var(--black);
            margin-bottom: 1rem;
        }
        .tag {
            display: inline-block;
            background: var(--red);
            color: #fff;
            font-family: 'Bangers', cursive;
            font-size: 1.5rem;
            padding: 10px 20px;
            border: 4px solid var(--black);
            box-shadow: 5px 5px 0 var(--black);
            margin: 10px;
            transform: rotate(2deg);
            transition: 0.2s;
        }
        .tag:hover {
            transform: rotate(-2deg) scale(1.1);
            background: var(--yellow);
            color: var(--black);
        }
        .project-card {
            border: 5px solid var(--black);
            padding: 20px;
            margin-bottom: 20px;
            background: #fff;
            box-shadow: 8px 8px 0 var(--primary);
            transition: 0.2s;
        }
        .project-card:hover {
            background: var(--yellow);
            transform: translate(-5px, -5px);
            box-shadow: 13px 13px 0 var(--primary);
        }
        .btn {
            font-family: 'Bangers', cursive;
            background: var(--blue);
            color: #fff;
            font-size: 2rem;
            padding: 15px 30px;
            text-decoration: none;
            border: 5px solid var(--black);
            box-shadow: 8px 8px 0 var(--red);
            display: inline-block;
            margin: 10px;
            transition: 0.2s;
            text-transform: uppercase;
        }
        .btn:hover {
            background: var(--yellow);
            color: var(--black);
            transform: translate(4px, 4px);
            box-shadow: 4px 4px 0 var(--red);
        }
    </style>
</head>
<body>
    <div class="comic-panel">
        <h1>BAM! I'M \${name.split(' ')[0]}</h1>
        <p class="bio">\${bio}</p>
    </div>
    
    <div class="comic-panel" style="box-shadow: 15px 15px 0 var(--red); transform: rotate(1deg);">
        <h2 class="title">SUPERPOWERS</h2>
        <div>
            \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
        </div>
    </div>
    
    <div class="comic-panel" style="box-shadow: 15px 15px 0 var(--primary);">
        <h2 class="title">EPIC BATTLES (PROJECTS)</h2>
        <div>
            \${projects.split(',').map((p) => '<div class="project-card"><h3 style="font-family: \\\'Bangers\\\', cursive; font-size: 2.5rem; color: var(--blue); margin-bottom: 5px;">\${p.trim()}</h3><p style="font-size: 1.2rem; font-weight: bold;">Saved the day with robust architecture!</p></div>').join('')}
        </div>
    </div>
    
    <div style="text-align: center; margin-top: 4rem; position: relative; z-index: 10;">
        <a href="\${githubUrl}" class="btn" target="_blank">GITHUB LAIR</a>
        <a href="\${linkedinUrl}" class="btn" target="_blank">LINKEDIN NETWORK</a>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'pastel_soft',
    title: 'Pastel Soft',
    type: 'Bubbly UI',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1518640467707-6811f4a6ab73?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg1: #ffecd2;
            --bg2: #fcb69f;
            --text: #4a4a4a;
            --card: rgba(255, 255, 255, 0.7);
        }
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, var(--bg1) 0%, var(--bg2) 100%);
            color: var(--text);
            margin: 0; padding: 2rem;
            line-height: 1.6;
            min-height: 100vh;
            background-attachment: fixed;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            z-index: 10;
        }
        .header {
            text-align: center;
            padding: 4rem 0;
            animation: fadeInDown 1s ease;
        }
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h1 {
            font-size: 5rem;
            color: #fff;
            font-weight: 900;
            margin-bottom: 1rem;
            text-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .bio {
            font-size: 1.3rem;
            background: var(--card);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
            text-align: center;
            border: 1px solid rgba(255,255,255,0.5);
        }
        .section-title {
            font-size: 2.5rem;
            font-weight: 900;
            margin: 4rem 0 2rem;
            color: #fff;
            text-align: center;
            text-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .skills {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .skill {
            background: var(--card);
            backdrop-filter: blur(5px);
            color: var(--primary);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 900;
            font-size: 1.1rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            border: 1px solid rgba(255,255,255,0.6);
            transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .skill:hover {
            transform: translateY(-10px) scale(1.05);
            background: #fff;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        .project {
            background: var(--card);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: 30px;
            margin-bottom: 2rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.05);
            border: 1px solid rgba(255,255,255,0.5);
            transition: 0.3s;
        }
        .project:hover {
            transform: translateY(-5px);
            background: #fff;
        }
        .project h3 {
            color: var(--primary);
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            font-weight: 900;
        }
        .links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 5rem;
            padding-bottom: 3rem;
        }
        .links a {
            background: #fff;
            color: var(--primary);
            text-decoration: none;
            padding: 15px 40px;
            border-radius: 50px;
            font-weight: 900;
            font-size: 1.2rem;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .links a:hover {
            transform: translateY(-5px) scale(1.05);
            background: var(--primary);
            color: #fff;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        /* Floating bubbles */
        .bubble {
            position: fixed;
            border-radius: 50%;
            background: rgba(255,255,255,0.2);
            animation: float 10s infinite ease-in-out alternate;
            z-index: 1;
        }
        @keyframes float {
            0% { transform: translateY(0) scale(1); }
            100% { transform: translateY(-50px) scale(1.1); }
        }
    </style>
</head>
<body>
    <div class="bubble" style="width: 200px; height: 200px; top: 10%; left: 10%;"></div>
    <div class="bubble" style="width: 300px; height: 300px; bottom: 20%; right: 5%; animation-delay: -3s;"></div>
    
    <div class="container">
        <div class="header">
            <h1>\${name}</h1>
            <div class="bio">\${bio}</div>
        </div>
        
        <h2 class="section-title">My Toolkit</h2>
        <div class="skills">
            \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
        </div>
        
        <h2 class="section-title">Featured Works</h2>
        <div>
            \${projects.split(',').map((p) => '<div class="project"><h3>\${p.trim()}</h3><p style="font-size: 1.1rem; color: #666;">Beautifully crafted digital experiences with a focus on smooth interactions.</p></div>').join('')}
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'aurora_glow',
    title: 'Aurora Glow',
    type: 'Neon Cyber',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Aurora</title>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --dark: #050510;
        }
        * { box-sizing: border-box; }
        body {
            font-family: 'Space Grotesk', sans-serif;
            background: var(--dark);
            color: #fff;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-x: hidden;
        }
        .aurora-bg {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: 0;
            background: radial-gradient(circle at 0% 0%, rgba(255, 0, 128, 0.2) 0%, transparent 50%),
                        radial-gradient(circle at 100% 100%, rgba(0, 255, 255, 0.2) 0%, transparent 50%);
            filter: blur(60px);
            animation: pulseBg 10s ease infinite alternate;
        }
        @keyframes pulseBg {
            0% { transform: scale(1); opacity: 0.8; }
            100% { transform: scale(1.2); opacity: 1; }
        }
        .content-wrapper {
            position: relative;
            z-index: 10;
            max-width: 1000px;
            margin: 0 auto;
            padding: 5rem 2rem;
        }
        h1 {
            font-size: 5rem;
            line-height: 1.1;
            margin: 0 0 1.5rem 0;
            font-weight: 700;
            background: linear-gradient(90deg, #fff, var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .bio {
            font-size: 1.5rem;
            font-weight: 300;
            max-width: 800px;
            margin-bottom: 4rem;
            color: #ccc;
            line-height: 1.6;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            padding: 3rem;
            margin-bottom: 3rem;
            transition: 0.3s;
        }
        .glass-card:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
        }
        h2 {
            font-size: 2rem;
            margin-bottom: 2rem;
            color: #fff;
        }
        .pill-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        .pill {
            background: rgba(255,255,255,0.1);
            color: #fff;
            padding: 10px 20px;
            border-radius: 50px;
            font-size: 1rem;
            transition: 0.3s;
        }
        .pill:hover {
            background: var(--primary);
            color: #000;
            transform: scale(1.05);
        }
        .project-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .project-item {
            padding: 2rem;
            background: rgba(0,0,0,0.3);
            border-radius: 16px;
            border-left: 4px solid var(--primary);
        }
        .project-item h3 {
            font-size: 1.5rem;
            margin: 0 0 10px 0;
        }
        .links {
            display: flex;
            gap: 20px;
            margin-top: 4rem;
        }
        .links a {
            display: inline-block;
            font-size: 1.2rem;
            font-weight: 500;
            color: #000;
            background: #fff;
            text-decoration: none;
            padding: 15px 40px;
            border-radius: 50px;
            transition: 0.3s;
        }
        .links a:hover {
            background: var(--primary);
            color: #fff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }
    </style>
</head>
<body>
    <div class="aurora-bg"></div>
    <div class="content-wrapper">
        <h1>\${name}</h1>
        <div class="bio">\${bio}</div>
        
        <div class="glass-card">
            <h2>Capabilities</h2>
            <div class="pill-wrap">
                \${skills.split(',').map((s) => '<div class="pill">\${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="glass-card">
            <h2>Featured Work</h2>
            <div class="project-list">
                \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p style="color:#aaa;">Engineered for high performance and scalability.</p></div>').join('')}
            </div>
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'glassmorphism_v2',
    title: 'Deep Space Glass',
    type: 'Advanced Glass',
    category: 'Creative',
    imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Space</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Outfit', sans-serif;
            background: #020205;
            background-image: radial-gradient(circle at 15% 50%, rgba(255, 255, 255, 0.08), transparent 25%),
                              radial-gradient(circle at 85% 30%, rgba(255, 255, 255, 0.08), transparent 25%);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 4rem 2rem;
            position: relative;
            overflow-x: hidden;
        }
        .orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            z-index: 0;
            opacity: 0.6;
            animation: floatOrb 20s infinite alternate ease-in-out;
        }
        .orb1 { width: 400px; height: 400px; background: var(--primary); top: -50px; left: -50px; }
        .orb2 { width: 300px; height: 300px; background: #6a00ff; bottom: -50px; right: 10%; animation-delay: -5s; }
        @keyframes floatOrb {
            0% { transform: translate(0,0) scale(1); }
            100% { transform: translate(100px, 50px) scale(1.2); }
        }
        
        .glass-container {
            background: rgba(20, 20, 30, 0.4);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            border-left: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 30px 60px rgba(0,0,0,0.6);
            border-radius: 40px;
            padding: 5rem;
            max-width: 1000px;
            width: 100%;
            position: relative;
            z-index: 10;
        }
        h1 {
            font-size: 4.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            letter-spacing: -1px;
            background: linear-gradient(135deg, #fff, #aaa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .bio {
            font-size: 1.4rem;
            color: rgba(255,255,255,0.7);
            margin-bottom: 4rem;
            line-height: 1.6;
            font-weight: 300;
        }
        h2 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: var(--primary);
        }
        .skills {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 4rem;
        }
        .skill {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.1);
            padding: 12px 25px;
            border-radius: 50px;
            transition: 0.3s;
        }
        .skill:hover {
            background: rgba(255,255,255,0.15);
            transform: translateY(-3px);
        }
        .projects {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 4rem;
        }
        .project-card {
            background: rgba(0,0,0,0.4);
            border: 1px solid rgba(255,255,255,0.05);
            padding: 2.5rem;
            border-radius: 24px;
            transition: 0.3s;
        }
        .project-card:hover {
            background: rgba(255,255,255,0.1);
            border-color: rgba(255,255,255,0.2);
            transform: translateY(-10px);
        }
        .links a {
            color: #000;
            text-decoration: none;
            padding: 15px 35px;
            background: #fff;
            border-radius: 50px;
            font-weight: 700;
            margin-right: 15px;
            display: inline-block;
            transition: 0.3s;
        }
        .links a:hover {
            background: var(--primary);
            color: #fff;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <div class="orb orb1"></div>
    <div class="orb orb2"></div>
    
    <div class="glass-container">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <h2>Skills</h2>
        <div class="skills">
            \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
        </div>
        
        <h2>Projects</h2>
        <div class="projects">
            \${projects.split(',').map((p) => '<div class="project-card"><h3 style="margin-bottom: 15px; font-size:1.4rem;">\${p.trim()}</h3><p style="color: rgba(255,255,255,0.5); font-size: 0.95rem; font-weight:300;">Modern implementation leveraging core technologies.</p></div>').join('')}
        </div>
        
        <div class="links">
            <a href="\${githubUrl}" target="_blank">GitHub</a>
            <a href="\${linkedinUrl}" target="_blank" style="background: rgba(255,255,255,0.1); color: #fff; border: 1px solid rgba(255,255,255,0.2);">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'zen_garden',
    title: 'Zen Garden',
    type: 'Serene & Calm',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1528722828814-77b9b83aafb2?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Zen</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Lato:wght@300;400&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #faf9f6;
            --text: #2c2c2a;
            --accent: #d8cdb8;
        }
        body {
            font-family: 'Lato', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 0;
            line-height: 1.8;
            overflow-x: hidden;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 5rem 2rem;
        }
        .hero {
            min-height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            animation: fadeIn 2s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .accent-circle {
            position: absolute;
            width: 400px; height: 400px;
            border-radius: 50%;
            background: radial-gradient(circle, var(--accent) 0%, transparent 70%);
            top: -100px; right: -100px;
            opacity: 0.3;
            z-index: -1;
            animation: breathe 10s infinite alternate ease-in-out;
        }
        @keyframes breathe {
            0% { transform: scale(1); opacity: 0.2; }
            100% { transform: scale(1.2); opacity: 0.4; }
        }
        h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 5rem;
            font-weight: 300;
            margin: 0 0 1.5rem;
            color: var(--primary);
            letter-spacing: 2px;
        }
        .bio {
            font-size: 1.4rem;
            font-weight: 300;
            color: #555;
            max-width: 600px;
            margin-bottom: 3rem;
            border-left: 2px solid var(--primary);
            padding-left: 2rem;
            font-style: italic;
        }
        h2 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            font-weight: 400;
            margin: 4rem 0 2rem;
            position: relative;
            display: inline-block;
        }
        h2::after {
            content: '';
            position: absolute;
            bottom: -5px; left: 0;
            width: 50px; height: 1px;
            background: var(--primary);
            transition: 0.5s;
        }
        .section:hover h2::after { width: 100%; }
        
        .skills {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .skill {
            background: transparent;
            border: 1px solid var(--accent);
            padding: 8px 20px;
            border-radius: 0;
            font-size: 0.9rem;
            letter-spacing: 1px;
            transition: 0.4s;
        }
        .skill:hover {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
        }
        
        .projects {
            display: grid;
            grid-template-columns: 1fr;
            gap: 3rem;
        }
        .project {
            position: relative;
            padding-left: 2rem;
        }
        .project::before {
            content: '';
            position: absolute;
            left: 0; top: 15px;
            width: 8px; height: 8px;
            background: var(--accent);
            border-radius: 50%;
            transition: 0.3s;
        }
        .project:hover::before {
            background: var(--primary);
            transform: scale(1.5);
        }
        .project h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2rem;
            font-weight: 400;
            margin: 0 0 10px;
            color: var(--primary);
        }
        
        .links {
            margin-top: 6rem;
            display: flex;
            gap: 30px;
            border-top: 1px solid var(--accent);
            padding-top: 2rem;
        }
        .links a {
            color: var(--text);
            text-decoration: none;
            font-size: 1.1rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .links a:hover {
            color: var(--primary);
            letter-spacing: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="hero">
            <div class="accent-circle"></div>
            <h1>${name}</h1>
            <p class="bio">${bio}</p>
        </div>
        
        <div class="section">
            <h2>Expertise</h2>
            <div class="skills">
                \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="section">
            <h2>Selected Works</h2>
            <div class="projects">
                \${projects.split(',').map((p) => '<div class="project"><h3>\${p.trim()}</h3><p style="color: #666;">A refined digital experience crafted with precision and care.</p></div>').join('')}
            </div>
        </div>
        
        <div class="links">
            <a href="${githubUrl}" target="_blank">GitHub</a>
            <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'monochrome',
    title: 'Monochrome Pro',
    type: 'High Contrast',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1512486130939-2c4f79935e4f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Black & White</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #000;
            --text: #fff;
            --primary: \${primaryColor};
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 0;
            overflow-x: hidden;
        }
        .cursor-glow {
            width: 40vw; height: 40vw;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, transparent 70%);
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 50%;
            pointer-events: none;
            z-index: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 5vw;
            position: relative;
            z-index: 10;
        }
        .reveal {
            opacity: 0;
            transform: translateY(50px);
            animation: revealUp 1s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        @keyframes revealUp {
            to { opacity: 1; transform: translateY(0); }
        }
        h1 {
            font-size: 12vw;
            font-weight: 900;
            line-height: 0.85;
            letter-spacing: -0.05em;
            margin: 0 0 2rem;
            text-transform: uppercase;
        }
        h1 span {
            color: transparent;
            -webkit-text-stroke: 1px rgba(255,255,255,0.3);
            display: block;
        }
        .bio {
            font-size: 2rem;
            font-weight: 200;
            line-height: 1.4;
            max-width: 800px;
            margin-bottom: 5rem;
            animation-delay: 0.2s;
        }
        h2 {
            font-size: 1.5rem;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            padding-bottom: 1rem;
            margin-bottom: 3rem;
            color: var(--primary);
        }
        .skills-marquee {
            white-space: nowrap;
            overflow: hidden;
            margin-bottom: 6rem;
            position: relative;
        }
        .skills-track {
            display: inline-block;
            animation: marquee 20s linear infinite;
        }
        .skill-item {
            font-size: 4rem;
            font-weight: 900;
            text-transform: uppercase;
            margin-right: 3rem;
            color: transparent;
            -webkit-text-stroke: 1px #fff;
            transition: 0.3s;
        }
        .skill-item:hover {
            color: #fff;
            -webkit-text-stroke: 0px;
        }
        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }
        .projects {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 6rem;
        }
        .project-card {
            background: #111;
            padding: 3rem;
            transition: 0.5s;
            border: 1px solid transparent;
        }
        .project-card:hover {
            background: #000;
            border-color: #333;
            transform: scale(1.02);
        }
        .project-card h3 {
            font-size: 2rem;
            font-weight: 900;
            margin-bottom: 1rem;
            text-transform: uppercase;
        }
        .links {
            display: flex;
            gap: 2rem;
        }
        .links a {
            flex: 1;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 900;
            text-transform: uppercase;
            color: #000;
            background: #fff;
            text-decoration: none;
            padding: 2rem;
            transition: 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .links a:hover {
            background: var(--primary);
            color: #fff;
            border-radius: 50px;
        }
    </style>
</head>
<body>
    <div class="cursor-glow"></div>
    <div class="container">
        <h1 class="reveal">${name.split(' ')[0]} <span>${name.split(' ').skip(1).join(' ')}</span></h1>
        <p class="bio reveal">${bio}</p>
        
        <h2>Toolkit</h2>
        <div class="skills-marquee reveal" style="animation-delay: 0.4s;">
            <div class="skills-track">
                \${skills.split(',').map((s) => '<span class="skill-item">\${s.trim()}</span>').join('')}
                \${skills.split(',').map((s) => '<span class="skill-item">\${s.trim()}</span>').join('')}
            </div>
        </div>
        
        <h2>Featured Work</h2>
        <div class="projects reveal" style="animation-delay: 0.6s;">
            \${projects.split(',').map((p) => '<div class="project-card"><h3>\${p.trim()}</h3><p style="color: #888; font-weight: 200;">Minimalist architecture providing maximum impact.</p></div>').join('')}
        </div>
        
        <div class="links reveal" style="animation-delay: 0.8s;">
            <a href="${githubUrl}" target="_blank">GitHub</a>
            <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'notion_style',
    title: 'Notion Pro',
    type: 'Document Layout',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1555448248-2571daf6344b?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #191919;
            --surface: #202020;
            --text: #e0e0e0;
            --text-muted: #9e9e9e;
            --border: #333333;
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.6;
            margin: 0; padding: 0;
        }
        .page-cover {
            height: 30vh;
            background: linear-gradient(45deg, var(--primary), #3a3a3a);
            position: relative;
        }
        .container {
            max-width: 900px;
            margin: -50px auto 0;
            padding: 0 2rem 5rem;
            position: relative;
        }
        .icon {
            font-size: 5rem;
            background: var(--bg);
            padding: 10px;
            border-radius: 10px;
            display: inline-block;
            margin-bottom: 1rem;
        }
        h1 {
            font-size: 3rem;
            font-weight: 700;
            margin: 0 0 0.5rem;
            letter-spacing: -1px;
        }
        .divider {
            height: 1px;
            background: var(--border);
            margin: 2rem 0;
        }
        .block {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: flex-start;
        }
        .block-icon {
            width: 24px;
            margin-right: 12px;
            margin-top: 4px;
            color: var(--text-muted);
        }
        .h2-block {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 3rem 0 1rem;
            display: flex;
            align-items: center;
        }
        .callout {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 16px;
            display: flex;
            gap: 16px;
            margin-bottom: 24px;
            transition: 0.2s;
        }
        .callout:hover { background: #252525; }
        
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 16px;
            margin-bottom: 24px;
        }
        .card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 16px;
            transition: 0.2s;
            cursor: pointer;
        }
        .card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            border-color: #555;
        }
        .tag {
            display: inline-block;
            background: rgba(255,255,255,0.1);
            color: var(--text);
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 0.85rem;
            margin: 0 8px 8px 0;
        }
        .link-block {
            display: flex;
            align-items: center;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: var(--text);
            transition: 0.2s;
        }
        .link-block:hover { background: rgba(255,255,255,0.05); }
        .link-block span { text-decoration: underline; text-decoration-color: var(--border); }
    </style>
</head>
<body>
    <div class="page-cover"></div>
    <div class="container">
        <div class="icon">🚀</div>
        <h1>${name}</h1>
        <p style="color: var(--text-muted); font-size: 1.1rem; max-width: 700px;">${bio}</p>
        
        <div class="divider"></div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">📋</span> Skills & Expertise
        </div>
        <div>
            \${skills.split(',').map((s) => '<span class="tag">\${s.trim()}</span>').join('')}
        </div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">📂</span> Projects Database
        </div>
        <div class="gallery">
            \${projects.split(',').map((p) => '<div class="card"><div style="font-size: 24px; margin-bottom: 8px;">📄</div><h3 style="margin:0 0 8px; font-size:1.1rem;">\${p.trim()}</h3><p style="margin:0; font-size:0.9rem; color:var(--text-muted);">Completed Project</p></div>').join('')}
        </div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">🔗</span> Connect
        </div>
        <div style="display:flex; flex-direction:column; gap:8px;">
            <a href="${githubUrl}" class="link-block" target="_blank">
                <span style="margin-right: 12px; font-size:1.2rem;">👨‍💻</span>
                <span>GitHub Profile</span>
            </a>
            <a href="${linkedinUrl}" class="link-block" target="_blank">
                <span style="margin-right: 12px; font-size:1.2rem;">💼</span>
                <span>LinkedIn Network</span>
            </a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'bento_grid_v2',
    title: 'Bento Grid V2',
    type: 'Apple Style',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Bento</title>
    <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #f5f5f7;
            --card-bg: rgba(255, 255, 255, 0.7);
            --text: #1d1d1f;
            --text-secondary: #86868b;
        }
        @media (prefers-color-scheme: dark) {
            :root {
                --bg: #000000;
                --card-bg: rgba(28, 28, 30, 0.7);
                --text: #f5f5f7;
            }
        }
        * { box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 4rem 2rem;
            min-height: 100vh;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
        }
        .bento-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-auto-rows: minmax(180px, auto);
            gap: 24px;
        }
        .box {
            background: var(--card-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-radius: 32px;
            padding: 2.5rem;
            box-shadow: 0 8px 32px rgba(0,0,0,0.04);
            border: 1px solid rgba(255,255,255,0.2);
            transition: 0.4s cubic-bezier(0.2, 0.8, 0.2, 1);
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .box:hover {
            transform: scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.08);
        }
        
        .hero-box { grid-column: span 4; grid-row: span 2; background: linear-gradient(135deg, var(--card-bg), rgba(255,255,255,0.2)); }
        .hero-box h1 { font-size: 4rem; margin: 0 0 1rem; font-weight: 800; letter-spacing: -1px; }
        .hero-box p { font-size: 1.5rem; color: var(--text-secondary); max-width: 800px; margin: 0; line-height: 1.4; }
        
        .skill-box { grid-column: span 2; grid-row: span 2; }
        .skill-box h3 { font-size: 1.8rem; margin: 0 0 1.5rem; font-weight: 600; }
        .tags { display: flex; flex-wrap: wrap; gap: 10px; }
        .tag { 
            background: rgba(134, 134, 139, 0.1); 
            color: var(--text);
            padding: 12px 20px; 
            border-radius: 12px; 
            font-size: 1rem; 
            font-weight: 600; 
            transition: 0.2s;
        }
        .tag:hover { background: var(--primary); color: #fff; }
        
        .project-box { grid-column: span 2; grid-row: span 1; background: var(--primary); color: #fff; justify-content: center; }
        .project-box h3 { font-size: 2rem; margin: 0; font-weight: 700; }
        .project-box p { opacity: 0.8; font-size: 1.1rem; margin-top: 10px; }
        
        .link-box { grid-column: span 1; grid-row: span 1; justify-content: center; align-items: center; text-decoration: none; color: var(--text); }
        .link-box h2 { font-size: 1.5rem; margin: 0; font-weight: 600; }
        .link-box::after {
            content: '↗';
            position: absolute;
            top: 20px; right: 20px;
            font-size: 1.5rem;
            color: var(--text-secondary);
            transition: 0.3s;
        }
        .link-box:hover::after { transform: translate(5px, -5px); color: var(--text); }
        
        @media (max-width: 900px) {
            .bento-grid { grid-template-columns: 1fr; }
            .hero-box, .skill-box, .project-box, .link-box { grid-column: span 1; }
            .hero-box h1 { font-size: 2.5rem; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="bento-grid">
            <div class="box hero-box">
                <h1>Hello. I'm ${name}.</h1>
                <p>${bio}</p>
            </div>
            
            <div class="box skill-box">
                <h3>Technical Stack</h3>
                <div class="tags">
                    \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
                </div>
            </div>
            
            <div class="box project-box">
                <h3>Featured Work</h3>
                <p>\${projects.split(',').take(2).join(' • ')}</p>
            </div>
            
            <a href="${githubUrl}" class="box link-box gh" target="_blank">
                <h2>GitHub</h2>
            </a>
            
            <a href="${linkedinUrl}" class="box link-box in" target="_blank">
                <h2>LinkedIn</h2>
            </a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'split_screen',
    title: 'Split Screen',
    type: 'Dual Layout',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;600;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --dark: #111;
            --light: #fff;
        }
        body, html {
            margin: 0; padding: 0;
            font-family: 'Montserrat', sans-serif;
            height: 100%;
            overflow: hidden;
        }
        @media (max-width: 800px) {
            body, html { overflow: auto; }
        }
        .wrapper {
            display: flex;
            height: 100vh;
        }
        .left-panel {
            flex: 1;
            background: linear-gradient(45deg, var(--dark), #2a2a2a);
            color: var(--light);
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 5vw;
            position: relative;
            overflow: hidden;
        }
        .left-panel::before {
            content: '';
            position: absolute;
            width: 150%; height: 150%;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, transparent 60%);
            top: -25%; left: -25%;
            animation: rotate 20s linear infinite;
        }
        @keyframes rotate { 100% { transform: rotate(360deg); } }
        
        .right-panel {
            flex: 1;
            background: var(--light);
            color: var(--dark);
            overflow-y: auto;
            padding: 5vw;
            scroll-behavior: smooth;
        }
        h1 {
            font-size: 4vw;
            font-weight: 900;
            margin: 0 0 1rem;
            position: relative;
            z-index: 10;
        }
        .bio {
            font-size: 1.2vw;
            font-weight: 300;
            opacity: 0.8;
            max-width: 80%;
            line-height: 1.8;
            position: relative;
            z-index: 10;
        }
        .socials {
            margin-top: 3rem;
            display: flex;
            gap: 20px;
            position: relative;
            z-index: 10;
        }
        .socials a {
            color: var(--light);
            text-decoration: none;
            border: 1px solid rgba(255,255,255,0.3);
            padding: 10px 20px;
            border-radius: 50px;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
        }
        .socials a:hover {
            background: var(--light);
            color: var(--dark);
        }
        
        .section {
            margin-bottom: 4rem;
            animation: slideUp 1s ease forwards;
            opacity: 0;
            transform: translateY(30px);
        }
        .section:nth-child(1) { animation-delay: 0.2s; }
        .section:nth-child(2) { animation-delay: 0.4s; }
        @keyframes slideUp { to { opacity: 1; transform: translateY(0); } }
        
        h2 {
            font-size: 2.5rem;
            font-weight: 900;
            margin: 0 0 2rem;
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: -1px;
        }
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .tag {
            background: #f0f0f0;
            padding: 15px 25px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            transition: 0.2s;
        }
        .tag:hover {
            background: var(--primary);
            color: #fff;
            transform: scale(1.05);
        }
        .project-item {
            padding: 2rem;
            background: #f9f9f9;
            border-radius: 16px;
            margin-bottom: 1.5rem;
            border-left: 5px solid var(--primary);
            transition: 0.3s;
        }
        .project-item:hover {
            transform: translateX(10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
        }
        .project-item h3 {
            font-size: 1.5rem;
            margin: 0 0 10px;
            font-weight: 900;
        }
        .project-item p { margin: 0; color: #666; font-weight: 300; }
        
        @media (max-width: 800px) {
            .wrapper { flex-direction: column; height: auto; }
            .left-panel, .right-panel { padding: 10vw; }
            .left-panel { min-height: 60vh; }
            h1 { font-size: 2.5rem; }
            .bio { font-size: 1rem; max-width: 100%; }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="left-panel">
            <h1>${name}</h1>
            <p class="bio">${bio}</p>
            
            <div class="socials">
                <a href="${githubUrl}" target="_blank">GitHub</a>
                <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
            </div>
        </div>
        
        <div class="right-panel">
            <div class="section">
                <h2>Skillset</h2>
                <div class="tags">
                    \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
                </div>
            </div>
            
            <div class="section">
                <h2>Projects</h2>
                <div>
                    \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p>Delivered robust software solutions.</p></div>').join('')}
                </div>
            </div>
        </div>
    </div>
</body>
</html>
'''
  ),
];
