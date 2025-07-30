Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE1C83F26
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ORM+1/dbumGo9EGWzsCinT/5PCx/aBi5wh7x10fGxk=; b=p2UKuHDrkUrzj1
	LhGa7y7gE8eg8ecBRglZ8hT5+T2CGrYu8g3KIyU7yCAttq1z5evQaPYScdNCUJdSI+wqcAH1LLrX5
	4ERLv3yIx/mzdJZNeyaXT9fWJ0i+nnGVIumGMszNFZXBvRcClEimkEBkdr+5trHsAQOMfwyDI+022
	EXAlrVSb865SGAvzYfQ4nObI0OiJSisNrjdeBoWmj+waqFsVUCZcnJodt192xn0aK/XIMZhNXQrDi
	8wRSczf/WROknsTYq8KIpltzPAj1LmZIkcdZVehM0Hf6qgCTIqwH5VeWMwjHnfvM8/UD6t2qqDa+m
	t037YSJ/XTI92LaRw39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh81m-00000001lXF-18pt;
	Wed, 30 Jul 2025 14:43:34 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7yL-00000001lCS-1u8S
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 14:40:02 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88bd5f7e652so326702241.3
        for <linux-i3c@lists.infradead.org>; Wed, 30 Jul 2025 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886400; x=1754491200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+/EyocnWfozW31T/mNyvD0w3Vb0gJmDVRrDiDkyjlc=;
        b=PDOCPwX2D+5Nht8cuZnoprmLbidtR7VbTASFkPzwKM47EjXnVhtqVCN0MCf048aKmA
         Lq/F200ZaRdO+GpHK4QDvDX81pWT3NB+yYVWmXvK7kgjY1UOPYASIShoMMMGggPnGuSS
         o/A8APTcRHbP1AkCqeVk7ISWRaXy/w0Aobjd/CxeEYDwiqL4uFS5Gv9t3GqCe0QnLIgA
         rhvwUQsxrZ3MKzV/72FInTdd/dVAVnkOqjbzptvP34Eh5LvETMD2aGLzDnDELKa9BHTi
         EOIlNYRzQrJ5YjYqSS7pxWVHXJsCQF+8+u/8SCQoolvet39qIlIS7WGYCCucwnqD099r
         cAwA==
X-Forwarded-Encrypted: i=1; AJvYcCW1nDIFjfBtcoE2UX4cwYiyfG47T9aCSb5to7beQy4oFO1NaFvcOQk0paSiAPCIX5TJdsYPxhZMogc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiv/B4JNAaZKe1sNzB7YpUtlUaHUP5gDuCTi6/f0VqEe59W6RM
	X53Crc0p07T5lDlYKhOrfFFzOvVcmepv0pWkr2aHzXQ6RGXgbF/3yD1RC1NdNa51
X-Gm-Gg: ASbGnct/k2MH/YHxr+wLyvR4RW+tgXgQNj7VuY5D5Uys+qKy+w+mrzBwWrJGb0SeCNR
	27yLM2ig3/3I2xOKgIXTei4KwNFZ6J22AXjp/w/bxRBFzEz59RbQvLqrXBXTRATFvphWLkudFla
	RZ5QzU2EjyJxrjSWgcOxxBJhbcEbJ4kOP409izr31nuqnqUrq557cWrOdesAzeG/MF2ChFSdlfv
	LHbh8x1A2Jrm7KFxQqaJu4Ah3TUzhrwjCI402DUdU3oBMJ6fa/N4rDXqG0hI2LQHkZbIaQcCD87
	WucYl37yrnvd5GKm0BwEIzHuHzdyOv/cNq3jYOj94mAMGVD8RuzXBSpo63D9uo2KtR29BTH2jnc
	mQvp52gRpIVgGPM5HZJea3rR60Arz7rtfpICMp+fmRQKeENGOfKHmJXUo8OIJ2j11gvkFwK8=
X-Google-Smtp-Source: AGHT+IFz3kbASWxJEC6NGwEU7sfe9M0IV+tBHq+ikC8Xn+JzCMoxgpHAiBHDf8b1ZANEIr0iKm55Lg==
X-Received: by 2002:a05:6102:8096:b0:4f9:6a91:cc96 with SMTP id ada2fe7eead31-4fbe87eab7bmr2491296137.26.1753886399691;
        Wed, 30 Jul 2025 07:39:59 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46e5c14asm2050456137.24.2025.07.30.07.39.58
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:39:59 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-88bc0cec30fso976746241.0
        for <linux-i3c@lists.infradead.org>; Wed, 30 Jul 2025 07:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp/mbC8e1JMJ6UpV3NNBTx0oP0nhoGbHwYwughXht3mBFaNyAas2jQROVKazgbbod0p7TLuhOjMdg=@lists.infradead.org
X-Received: by 2002:a05:6102:1481:b0:4ec:c548:e57b with SMTP id
 ada2fe7eead31-4fbe7ad20fcmr3270846137.0.1753886397780; Wed, 30 Jul 2025
 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com> <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:39:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
X-Gm-Features: Ac12FXwSHxwgh1iE-RiAFlbvbPUyCFA8Vv2qiKkbn-bMclgIM8YsBFxjbxa_ny4
Message-ID: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] i3c: master: Add basic driver for the Renesas I3C controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Frank Li <Frank.Li@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_074001_496929_7E488953 
X-CRM114-Status: GOOD (  22.93  )
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

Hi Wolfram,

On Thu, 24 Jul 2025 at 11:41, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a basic driver for the I3C controller found in Renesas RZ/G3S and
> G3E SoCs. Support I3C pure busses (tested with two targets) and mixed
> busses (two I3C devices plus various I2C targets). DAA and communication
> with temperature sensors worked reliably at various speeds.
>
> Missing features such as IBI, HotJoin, and target mode will be added
> incrementally.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks for your patch!

Just a few stylistic comments for now...

> --- /dev/null
> +++ b/drivers/i3c/master/renesas-i3c.c

> +#define REFCKCTL               0x70
> +#define  REFCKCTL_IREFCKS(x)   FIELD_PREP(GENMASK(2, 0), x)

Interesting... Usually the FIELD_*() macros are used like this:

    #define REFCKCTL_IREFCKS    GENMASK(2, 0)

    x = readl(base + REFCKCTL);
    a = FIELD_GET(REFCKCTL_IREFCKS, x);

    y = FIELD_PREP(REFCKCTL_IREFCKS, b);
    writel(y, base + REFCKCTL);

That way you do not have to duplicate "GENMASK(2, 0)" in the read and
write marshalling macros.  But I do agree this driver does not seem
to have register fields that are both read and written ;-)

> +static inline u32 renesas_readl(void __iomem *base, u32 reg)
> +{
> +       return readl(base + reg);
> +}
> +
> +static inline void renesas_writel(void __iomem *base, u32 reg, u32 val)
> +{
> +       writel(val, base + reg);
> +}

Why not use readl() and writel() directly?
To make it easier to add debug prints during initial development?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
