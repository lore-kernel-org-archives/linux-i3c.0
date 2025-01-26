Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72326C0219C
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhRXZwFh6Iw0wzcRofx/XAb9MErWiChC2NLwY8nqV2g=; b=CLU3UFO3rMPleo
	4MVrXHXnQkvTdqDkqmUK7ML4UH8nwzIe8ymCGVrn2a79R5qJT/RcXfMeU/Ik4frHqJ1cjkVxlU532
	fafMwi2HO/S8CfIb+k2ODxZToBST3Y9jQZYTd+KjtD6i11nuzwpvQNQsWz51YGPHzK6Kps3pRLbPq
	qRHMWPeEmQqtlk8TulypXZwtUy9cQ3I9dgto5n+wkykGHya05HyLpXR44pP7us/q9m/0r11C2elYN
	m/uD6jcIYKt3O8gLWx6kMQrq0oE/ChEdCgFZEW6HHNyS7XRpyWp/xnrvrdnR4jZjDo9pWc8Bwko0W
	K0cKNYt+dmM/QvDPF0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElu-00000007lOv-0dwu;
	Wed, 29 Jan 2025 20:34:50 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc93n-00000000u46-3YPL
	for linux-i3c@lists.infradead.org;
	Sun, 26 Jan 2025 20:16:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so4135905e87.2
        for <linux-i3c@lists.infradead.org>; Sun, 26 Jan 2025 12:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1737922605; x=1738527405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZNtPux4k4w5u7VqNlBWLfdc0tNe6lI5K/xKjGCzzlM=;
        b=WFKUHtzRoDdnkf9eMT1W/9rEqXailMkd60yeqlp1+dDURqIp6di3bL0AX8lFwfxsO1
         UNYRy5RsRvQENnsOgMm9EfSKPaku+itThkd6YfeWj4OrcJLI0Z0Ui9SJB8DC1K3h+rlg
         /HtPg4/LmHc2wXCeBRUGUACFuW5pMK9s2v/68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737922605; x=1738527405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZNtPux4k4w5u7VqNlBWLfdc0tNe6lI5K/xKjGCzzlM=;
        b=H24vFEYrK7vIr+PsN0iCQdvflOoUqnGTmw+z9IKAKb7BRAsAJzDzfQQsYstZCxx2oQ
         NOtMTHN9Gm+fp+TsUbAmaOFaGnkBwgvvcEiwvEG7toIpHF98JkVAZDYLFGQ4P2JtWa9Z
         /2WCzIJK64+vIKOuugFuqU4jAJhWM4i2vsqWW/DATwkCvJA2bkGWFSKuvgh1XzRUoowF
         25uMahHPZVsoVuJYKGT/Wqcw+j3oYl9IIzH948/x1w3GjyL9rAzk6sFqCneHyAdgWOyy
         yrH3WQ1wzZHFdR+D4k84CUCijqJ3qjE7uzSpPjgICCvP/tpf4iv5VWDvVX35SQVteVWF
         SH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYI7opxY9CKYSmygprDynzc/4NSaPCwqIXRZBRMgEbUj9dAHLQ42JN0bOutJirC1hsUArOcK/ROa4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyROYq/RRHY5VHIJ+Eo4cQFl3y7j45uU4IBx2CPM7zDxuakeXt4
	2YK9V0E9YHc62OUxbFGOO4OY3/0wT04yBDWgk0mWa7yaVj4oN917yr/eTYjePMxQDrkGfwtroz/
	WVDMx4OlZIQ8E91Z4vXBTBDhNCn9123BJJb/xPQ==
X-Gm-Gg: ASbGncsEs0GkU1qoh2Lf+HaxcA4r810LQU3uZO4x/hgA7cTLZwzb6XuD9Uu910/elky
	3cg1DuVp5xaZ3C/8Yco3PVGhp8lxYIugvc+k3l0kfOQPpUTm6WZODMXA6yk/fnQ==
X-Google-Smtp-Source: AGHT+IHpNJrz9WMWch903TAiyexD5im2md1AOlljCOD9VDetDI+IYBTtnHkZ7in2filpfAXyEQB0mkMLJrBAqb/m4So=
X-Received: by 2002:a05:6512:3b09:b0:542:2f0f:66d9 with SMTP id
 2adb3069b0e04-5439c246297mr15817353e87.16.1737922605340; Sun, 26 Jan 2025
 12:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com> <Z5Z06WowFspmXby9@thinkpad>
In-Reply-To: <Z5Z06WowFspmXby9@thinkpad>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Sun, 26 Jan 2025 21:16:35 +0100
X-Gm-Features: AWEUYZm3rp0vUAqIsh0TRNx78BDvcUFd99-_H2ukVHyEscR3EILieZHz010UAVU
Message-ID: <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_121647_890850_6DA6A26B 
X-CRM114-Status: GOOD (  11.08  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, 26 Jan 2025 at 18:46, Yury Norov <yury.norov@gmail.com> wrote:
>
> >
> > >          */
> > >         val ^= val >> 4;
> > >         return (0x6996 >> (val & 0xf)) & 1;
> >
>
> If you guys feel that you can explain the algorithm you're employing
> in a half-VGA-screen comment, it would be the best choice, and that's
> enough.

So when I saw this, I even wondered why it needed a comment or
reference at all. I thought table-in-a-constant was a standard trick
everybody knows.

Isn't "The constant 0x6996 has bits set in exactly the positions
corresponding to four-bit numbers with odd parity." enough?

Rasmus

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
