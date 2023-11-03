Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3387C4332F
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Nov 2023 23:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZ8ZS/ZwjJSDjMJY83trbxMrXKKYvqlABW6k2W9id5s=; b=l8XsKfrL3z16ff
	lYJyUf2pj/VNzc1Uy99cc4Ce0xyyYcfwOg2pSGX3FH4ytEoOL/car/xNHMISHFZ6cGUB/KYMg3nTB
	45N3iWVnaKZ9/mO91i2fk8MmirFKf7VPDu7N0aig/HOna1cOKppqAq6IG7STxL7Aymtm4COb5npm6
	IpnZ74DMHxzb91TiFz2eI4aDyRqwiNRmLrYWKIAu5kWZYW2YST6gYw/ICUEoi+2CBEwfLjvjatg2+
	1IMWiIJLEKJFquScAGktIQnAOv3bZu7zkRPxk2NPsvLu5hi49LiBork12XRshlY+v2RaGMLrIYrGq
	gzNOcrzTdh2RK++Irc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3na-00CLJO-0Z;
	Fri, 03 Nov 2023 23:41:58 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3nW-00CLIQ-1M
	for linux-i3c@lists.infradead.org;
	Fri, 03 Nov 2023 23:41:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C586240002;
	Fri,  3 Nov 2023 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699054908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01UalbeeXeLylUyRzF/vSpZA0gSYvuxFA9cB6+h3P1Q=;
	b=l7vr27CXDc41xs4jbHLNnd0VYqkRE7A5NvcwQnO7NZjSQL/5wzEIKxItB345z97S+G6gfM
	FHyVvTMaPVFcBoNmuWxZRCtzwWhoinbvoSLoy1ZHYOMG73D4sRSkGsbSkAd5Tj5zqhLnpH
	6yj9GT1i9A2yOCqNw1TbFWIpZ9SoNb+13KBmx78zI4tgm68dHzOABq3ZoKwax1ZR/uDxPA
	I00zWwShBj5+WAYLxSSSt+LLItXNFFv2i0vhqH94EN8TxWIuGOQqb3RflwY0UwEEP+/mjh
	Oe2CoBFzcRUMnyVu14VoBRfE5Dy8v2GnkakgOCQeKE5I7ACkgawj0aFCCOXWrg==
Date: Sat, 4 Nov 2023 00:41:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1] i3c/master/mipi-i3c-hci: Fix a kernel panic for
 accessing DAT_data.
Message-ID: <169905489155.439104.1007504050351939428.b4-ty@bootlin.com>
References: <20231023080237.560936-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023080237.560936-1-billy_tsai@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_164154_759113_8E8910E9 
X-CRM114-Status: UNSURE (   9.66  )
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


On Mon, 23 Oct 2023 16:02:37 +0800, Billy Tsai wrote:
> The `i3c_master_bus_init` function may attach the I2C devices before the
> I3C bus initialization. In this flow, the DAT `alloc_entry`` will be used
> before the DAT `init`. Additionally, if the `i3c_master_bus_init` fails,
> the DAT `cleanup` will execute before the device is detached, which will
> execue DAT `free_entry` function. The above scenario can cause the driver
> to use DAT_data when it is NULL.
> 
> [...]

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.
      commit: b53e9758a31c683fc8615df930262192ed5f034b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
