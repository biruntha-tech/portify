import 'portfolio_template.dart';

final List<PortfolioTemplate> appTemplates = [
  PortfolioTemplate(
    id: 'bento_box_modern',
    title: 'Modern Bento Box',
    type: 'Trendy Grid Layout',
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
];
