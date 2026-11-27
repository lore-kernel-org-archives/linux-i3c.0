Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDD606A31E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1t7p+M4t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=pFPWirMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QEysa6zebFFXs7KqKVCBZ5nbTRtqLf4JvrCK8FoeXSE=; b=1t7p+M4tE6uA0jjlCZspmMO8Vh
	b+KByjqGGXc7CGpYyAe6Kznmk2SJB2O2cxpSb2l4R/YY8ETu5n7Vypzcr+xKpaCsZA/b+StjMJzwz
	tPUlnJYBHUvvKKZ1mRrAPomPd8Zg+ZIAos2B9g4T6bavIZvOnRYLWOPP6NdpdYuTd4/1x1NI4LqFl
	DW2SwREnXCAAq6FU1nf2wrO8FHzfi0jB7qr8RIx/s0d8eHN/OE+ip11fzdj2aDzoD7Kmi0icNnRSN
	8cXuL2eEkWtRYYn0CEgmWNyu0Q4dveAImNqL8VFRx3rShqBKXhkaxwtNm2lL2+nJuy6Q52FMft5Lp
	CsiiYRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs4z-0000000FP55-2u2g;
	Fri, 27 Nov 2026 09:17:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs4x-0000000FP4W-20Er
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 09:17:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3597016f8f.1
        for <linux-i3c@lists.infradead.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=pFPWirMp9JKVw94yKdhaGTwUVW10ayYO+mRx2tpblhPV+q5JRQJQVzbJa1iUGyoIs2
         pFK3ahTZXArr/q/Tw5MazS4lCbnWmbIbfW2Eu24sTu3shuQ4eubC2darRBte9kK4QnYV
         MOWXsKBulyq7gmiDXzUYgLVuMBOJsMDIzxeYhjNMwDcZi1YEEb1Jesc0IbEqVMQfic6G
         hEO1VrCR8nQyYbfAEpIZFzmfQ/qiGnybT8RyroaFX1q/gebSK6UaaHcWbh5veo6xEAkr
         LHtxTxukbGngY441Ifmydvj1g12zXEAf+t91KR+PDZQkRRueFYXE1RVrPjFYKKMhXIR6
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=BTIM/QvdQ3gqIkVydxo+jdixfM/TsI+HmtYWec6dwcO5DIzzVLHeV7a3E9wMGdXYFo
         zzjo9UGkp1vchMpZKriS67qh+AtScVj6W7nEfozL83YBnUdxdfnJWFg1QFlsC2K1Fd2m
         saMTejQGsg2AaamQ1UfECDcTQcAIgZzDmF26U76cjW/2n22G3LozLFd9+RGLHlFBaB67
         550i/vufcXrL2YVkuxy7nbEcoWWPUqhv/qafJ1jVAtm46C1plqvusNRV/lz4TmOydYEB
         8BHuh+0gEFHRgo/ovdNXhXL6FC25y8mNV3/N7GUn4UdpczGBOfA0Pck7jgkfNLiWA9wV
         PPDg==
X-Gm-Message-State: APuU4Z8d8YifumAybO6KsBh5dT3DBR0A15ymLb7eYB3SepmJVkHmZ5XB
	x96RA/DLiW/tkvYhW5hUQo/Iz8j6XhRWNjh34mCdJ/VvqfMDKrskVOPUsl/GNY9wFZY=
X-Gm-Gg: AZFdTZcGmVeR5681aFeXtVF0NL+XOZkGwyFsoBdZAq86N/jNbTw4xvnLe42tY8l8B5Z
	94xPhyGnli44MU61esYOmQY+3RP1PGVoSEXtAQTQZuLBEsylBAXTDQ5P1mbhMf+q+mvyX17kPMX
	tE/bGwdk1O2PuMnRB9vJwk2N1vBkmblGjor1x9p7eHxfk6aBPNv1CJDuKBuaFhiAK6JGBVyVIg5
	QhvZ7YAdyUpTdeNLYSjg5W/8I64gUm8Cfh/XnGV7taPQ0Ci7OB9/4NQtvHXNcJ+KbmXJu3XXyFW
	tRNdhSF7LZGGL2hdXwQTUOU1rgAyHawI5Og5kOrQt8GhDpRVaPGcHdMysbfBMHRn3eQQDztcX0D
	zkZin002DOY9/CU1pnhMBB8G6MAvdWrUJbyIYyTtcy40GDTiLgVfAVVBsIOyiUOUzBX5ymI0twM
	93nR8kuRpDlOn8t9fvBP9+37rtmuOAzWrTDUNDWcWdrP6Q/ImbsgXVGa37kwopubNVxpHhSj3xy
	/6AUId6a2NXgAK57eIgALkYej51zhMlqfpGDjcqQ4mqIk2pNDF/SmpEmLrwGfRdGyCTbjY6vuQh
	biWgHAIFZcVZvGFojKrNQL+sbpLRgCLm2A1B
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011715_524096_B90A2498 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
