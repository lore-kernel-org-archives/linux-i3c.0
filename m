Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2425EC4345F
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AgqROb0n0+mKEumg0wua3xS5s7KsXBnvY2K0dDhLzc=; b=RN3lgjr3ipP0eF
	7wxDFN9m5lsaK7/dPZNB+0zdV1yGSbjKSRncR13dsdQcGg0CpKT2d+wN/JeFkgNbtePPu3ztvpgTS
	mg6UapXhdzfT1nsNJcOc4/5GykLWhGkB8I/NVrMnA3kuSHRRaZaK2YV/m8/vHCkS/fZMdmID38YUj
	LMdJ4lYQMx9CdUq2IMOoU2/6TI7LmjKtwKLAor0wkThOm1dctPhxFr4g9BtgYVS05ohZWU316tCTN
	UDBIT1N6ETGM/h/gwwn9Mz0iAOV27eFsMCuqhSixiAD+S3sPJIYRiAgQB5Q79VKqiibv4llg0Fy93
	DV/prfPHbewG45LB2l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sIk-00000006NWU-1yTD;
	Mon, 06 May 2024 06:58:18 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sIf-00000006NVO-3NPZ
	for linux-i3c@lists.infradead.org;
	Mon, 06 May 2024 06:58:16 +0000
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7529F2009E;
	Mon,  6 May 2024 14:58:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714978688;
	bh=KTosghxQNHVYhSKYObdt0iokXKH5I5YpZAT4NGfcuWY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DR9HM8+v92MNauFrWh1860sTlDoPGOkJWnpTDMu4sq42e+tk0qS2L+XPrY6sO1WpW
	 s3InFERLo9hW6gzaAWD8uHnGpED+SvDGbSe2zVmy8NXrit/EdClZjqMfPG7OtxdZIl
	 Okepnll63+ceOd885C8G2Mm3YUVYjr+9og64HqAl0pNnQkkMPxW/eu5TEcp5HoPk44
	 X/QExCqrHcHm3/jTP5Au7gdkYGB9nmZFYynAp4cVCSRp1vFV7LlPKjAHplg7yGTRnV
	 y598eml+Y8afzY92VGj6vyluKBoEENuK/9K3uPQm2hIUudlUpMgyG9Aec+ZdzrfzF6
	 i3EM9qU4PWn+A==
Message-ID: <52f4e4afef87c336f054ca1c43eec58d2e44a5b1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>, 
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "zenghuchen@google.com" <zenghuchen@google.com>,
 "matt@codeconstruct.com.au" <matt@codeconstruct.com.au>, 
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Date: Mon, 06 May 2024 14:58:06 +0800
In-Reply-To: <TYZPR06MB65678EE7611DDB825E5404C19C1C2@TYZPR06MB6567.apcprd06.prod.outlook.com>
References: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
	 <563ad5613e9c5f0671e1f49f2d9ba71d8735799b.camel@codeconstruct.com.au>
	 <TYZPR06MB65675E5D43EE265DD702E5689C182@TYZPR06MB6567.apcprd06.prod.outlook.com>
	 <645d4f645b1296d54573c4fe734768adab160035.camel@codeconstruct.com.au>
	 <TYZPR06MB65678EE7611DDB825E5404C19C1C2@TYZPR06MB6567.apcprd06.prod.outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_235814_067228_268C797B 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

Hi Dylan,

> > The initial state would be to have all SIRs masked.
> > 
> 
> Yes, indeed. The "global" variable is also true because "reg ==
> 0xffffffff" is true.
> Therefore, the INTR_IBI_THLD_STAT bit will be set in the following
> code.

That's mainly my point - none of this code is ever run unless the
->enable_ibi or ->disable_ibi controller callback is invoked.

So we'll end up with the HJ interrupt only being enabled if some i3c
device driver enables IBIs, which is a bit of a weird side-effect.

It probably makes more sense when the rest of the HJ code is added, but
not so much as a standalone patch.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
