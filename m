Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FCDC61DA4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Mar 2023 13:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUotASi5s0+8vv9rhrfLwlZdkEls6FKMOTSuEcSmV9s=; b=06wVAg7tLrPvf7
	lJpRSNWCJbZUauL1yEqZH5217AMKaHBlx6jSDy2Ze1Zf5KUnBfxhoPZHI6cdj9TJZbjbNnGy7nTbJ
	5ju3svqGzsBVE1qNJ3jtOdXq4bOZ9jYs/Jt/w7tlZBxdJ4LlRGLDq685hQckkQU1zaMWWh3CzKSgx
	AoR8m+6wo9KI2zWtGwbDFnbfek9xLVlTCsjk0x3XVk4Z976h4hhvrP/NoB27lbwVxB58a+nElfrCD
	hre2G86Iz1RvcZ5ArIE+OMTr2I2+QkbNqilDIF1xGLtTlK+iPA3ujXfgK2VnQCljFkcIa33HDGctf
	oXc/FH3lH5h62ANR8Yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiSD-005wo2-JW; Mon, 13 Mar 2023 13:43:09 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiQz-005vou-6a
	for linux-i3c@lists.infradead.org; Mon, 13 Mar 2023 13:41:55 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7492340003;
	Mon, 13 Mar 2023 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678714906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNi+f4vorTzE04nFBS+fe+Vq/HQDmZwpZvJXiXO/HEs=;
	b=ELMxynyL2iduOJ7LXr8Ejg2fe/AjIJFWVrqkueZn7R5GMhjKmx8Q3RjnrI1zFa5WAOMMDX
	OO9E8v5urc1kCEn4nPgM/k6uNW7bJy7a2GmKldB4cQZ8EjmPGzLYhLtku3l2uBObDh+B7+
	vQVfmIpMjavYy6s8kQWUEy2UvZVCiv5n5BKSf9exLtaEDldPdsuefsc5b6Tnq9XrPgKU+k
	ySdYHJPCLJeFnoFvF24zjNJkKEvjDV9IGGTvtzdYVzy5qtMeizJWrv5JBHjiesjifgul2M
	9xHDptyGPbelPj6xB+X8X+IQ8Qlhkf93BtfePUqk7/Sc1t0L4CpImMcIg8QY1A==
Date: Mon, 13 Mar 2023 14:41:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i3c: =?iso-8859-1?Q?Cor?=
 =?iso-8859-1?Q?rect_reference_to_the_I=B2C?= device data type
Message-ID: <167871488920.397851.15793351776406700265.b4-ty@bootlin.com>
References: <20230302161206.38106-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302161206.38106-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_064153_429954_B2A77F8F 
X-CRM114-Status: UNSURE (   7.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


On Thu, 02 Mar 2023 18:12:06 +0200, Andy Shevchenko wrote:
> I=B2C peripheral devices that are connected to the controller are
> represented in the Linux kernel as objects of the struct i2c_client.
> Fix this in the header file.
> =

> =


Applied, thanks!

[1/1] i3c: Correct reference to the I=B2C device data type
      commit: ce48f955860db841eeb4bcf9bb973ea3ef177b3a

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
