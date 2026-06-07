Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D6CD8C88
	for <linux-i3c@archiver.kernel.org>; Sun,  7 Jun 2026 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajz7tMcgphrw2wSoTRSPlqG10IL/2uBser6U1UgjFsc=; b=VXcNrkwMpVO9YGkYFhZA88MBbt
	PmofpIr9CAywLJ5T101FH2f9JsvkBTQZ6jQa2+Agb+rklPHxkW8rKQv+d3JWXIzUXRmauRqXxbBeU
	AcWyL8mNilAIhJYjWfWjzQ7xUIR5BTV61KGjIs+9Pmo1L/ZuvAAugykHy3GfrUHqeiUymWVrUa6ER
	TmP5AxWcyYnzzCXa4OTggb6UAr9PexKqg4SJ02sYIMT3wdxBF3KB2xWd6WIEwNrW6hF446oiwEJhF
	MjIuTSGRcOWX/ZCxgjD2HfQx0c46yuITyz5T2jKS/7tRMweLjrp7+idWLmI8/jhml7sv9G/MlNiYH
	MqxUPqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCTJ-00000002EeE-0wmt;
	Sun, 07 Jun 2026 12:19:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCTH-00000002Edy-2w0b;
	Sun, 07 Jun 2026 12:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 102B242D63;
	Sun,  7 Jun 2026 12:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CFD1F00893;
	Sun,  7 Jun 2026 12:19:14 +0000 (UTC)
Message-ID: <4330e1e6-9513-4674-8795-b4150c3c1aeb@tuxon.dev>
Date: Sun, 7 Jun 2026 15:19:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, tytso@mit.edu, cristian.birsan@microchip.com,
 adrian.hunter@intel.com, npitre@baylibre.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 5/25/26 12:24, Manikandan Muralidharan wrote:
> Durai Manickam KR (2):
>    ARM: dts: microchip: add I3C controller

Applied to at91-dt, thanks!

> 
> Manikandan Muralidharan (3):
>    ARM: configs: at91: sama7: add sama7d65 i3c-hci

Applied to at91-defconfig, thanks!

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
