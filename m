Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E2606B1CE
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t65p3YQa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VT062jtxBjpYMzXsbOrvglBH1qinFtDDb/Av1kADKtg=; b=t65p3YQaUAEnFdzkiaut/FVuEq
	f3vtUfqViDz4MOSRRkadoCIApLVgkAf1kjN5JTvixSxPQu2w8+hcdmgF/+sbK75/xRSICmzZQbLdR
	4QxgIEeF1aWWn0hYF394RSxDX4lFRhdbPy2Wzsp19f0bsYAN2Bh3wwqM3PNrwnfZOwIZBvJG+DqjX
	+st7HS2jkl6dQNXYz8bIv+MxV5CIU/ZjQbt/5tn2QV2xldGEkitZzXePfklxrYpg5GCQboi7NBcsm
	DFBCoOu9nBfVt0Gauc3avKb3oCejSldfcJud5N06tP8mH+5TrLFoxONFkNRDtc5vQAd4ocR7Rrx5o
	LKZXhhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu8a-0000000HB3y-1CM4;
	Mon, 02 Nov 2026 15:39:56 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu8Y-0000000HB3U-0HYf
	for linux-i3c@lists.infradead.org;
	Mon, 02 Nov 2026 15:39:55 +0000
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab01c46697so32323221fa.1
        for <linux-i3c@lists.infradead.org>; Mon, 02 Nov 2026 07:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633992; x=1794238792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=2WZmO+VUzJjpgIDZDfOQzmBFsWn0W3Bemz+4wJHXA+g2wkcVNKgjFGy/ZRbDCxtKC5
         Zq+8eaJ/u1rKFtghd+dekFKtqVQADfBi8+Vrs3ooIn4hDdLPao7ZyKaxQI2ooe6OMleh
         c0Ws6jrEdm9/SrjmXsXxL/3pS/fB9wy+uV69yI6sodRr/WIiZ1Xg4fNs2UxpD435OWuU
         iz6Trwbv4iTCFzhszZHj2HuWYYb8/0PwVqrucagWMjgq+8jAyYGCfUZDktdXrxPfVxOb
         3BR2ePLiS8GweCGOTLq8eBhI+bfmKGUmkZpC5mlutfY5Bnr6KywdlDOuEZHWFnW0mW/X
         wsFA==
X-Forwarded-Encrypted: i=1; AKwUvBzu+TAGpJLMvsLrbDgn/Vdvxmm6I7h6PMlBgvBjcJzuH11re4XXDOfw02/ZVa6I8lOlt1kboV9Ebm4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9rrwmo0LErqzpdAGchctHs/rRt6H+yEPlAPW7LfIIc3o4C4Ulb
	lh/JlHyz2yFFmJ3XfveU9+MgJ9cY5lqsH8e/G7xqIx7rzCCBHYyZ4kXGw0BSKmFMfZw=
X-Gm-Gg: AYBFou3dHHVT5zo+3hC0Wv5LCrCOt0vpXKrlPQtrc91EinfAXh1eiCP+8WejjsHIdOF
	Oa+gLM3ZFaitvBW6+Kq999eQqn6mY/CMCLqvJ0tU3xQuXDfkB1x92vOFjKuOpNpeAxUOsHmNg6t
	BrcZJ4C2i9Z49xUQejOc+aq/usgf/qK85iOiKnaTwpEHzeQ/PEf8XPua+fYwCDTu0D4J12+IQJ8
	rUC/HHxYBYQIW5Tk9uXrbuNgcKdlYcbyru/u4EZNjTRM84XT4OAkNYYrW/qHwWH9d4135ojnmAW
	rKAq8c1l7WWZc6742BHJFhWV1laIXWATSNLM/7a90jQH77QQSRnBOD93ez4UyOdN0nFs27RW4/3
	+JjPZQj7mpegn5JIo2+sUpiRhdRJbs0WsYOlWCwebxd6gODS0hqzd2tQaeHKPNdVfYyUrGapt3U
	3CBfnREBhQvXtZRRu8EXQz1Im/U6BCVEHz3LwKhZ9vNQUb2lY91H2IcsC26dQXjiBThhzmEes7J
	zZXfnuWzQDOb+bT0N49lLjDWr9Sz1HfgGtVrTw8lAmQ7WS23svAcqySM/TBmbhq3bbg0lNZNhNX
	ZXqQD67H7sNfyviILCsdqnTUwoyw2yV2NLZFLaNGXsz9kznz1l4HKpHzaruvT12x3w==
X-Received: by 2002:a05:651c:1473:b0:3ab:4eb4:5ef5 with SMTP id 38308e7fff4ca-3acb7a4932fmr25597951fa.9.1793633991627;
        Mon, 02 Nov 2026 07:39:51 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c50f49sm132321fa.36.2026.11.02.07.39.50
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:39:51 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so2239384e87.1
        for <linux-i3c@lists.infradead.org>; Mon, 02 Nov 2026 07:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx1mTcES1sd82dB448D1tVFNQsYGbRXN0rgyqstXIrO0P3xX6ikovWAaW0LrEziC7DJ/UzyLnhzBTc=@lists.infradead.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_073954_137533_E165CA1B 
X-CRM114-Status: GOOD (  17.14  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

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
