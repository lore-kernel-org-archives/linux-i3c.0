Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACADDC46467
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Jan 2023 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6kmtUSoYuB8TwyqdGtnE5ruvZKI1NSDpz9XrL14Cls=; b=YNJz700x8tH9EL
	mtVWL84qh8PVgx4htJ7bmy9pXKvHsoT/U3drbGDwVu0Gb+GLOu/OmLV9QBasOZiRHkS09fppMBTiV
	esduI0KNhb6dVZTE/dS514vuadWiRSiBao59RIJktIMkSVUXEUS+VIQk0R6rpfl0ZuVbKZihb2RdI
	r/8LvXTvs6Qs840lRUefqgdpk30UQfQ60CtI/sG+3P/Z1S2f9kWX1DXn/WyPAeX+94IKfcvR4diUX
	g0XL9R+k7FQPFUNqfm3GvD3SniuHKO3w9eorFd56a6GgequFTIrhQ7CjFzJJ5mpa6/ezgLsLuagAf
	MoKz0ADXeTxpZ+CbnzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEum-0076EO-PI; Tue, 10 Jan 2023 13:43:44 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEui-0076DM-UM
	for linux-i3c@lists.infradead.org; Tue, 10 Jan 2023 13:43:43 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A405124000C;
	Tue, 10 Jan 2023 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673358215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KJKhvDdvPIztsi5DnjKbmNy7+xwHNtCSveA1o7bsZ5g=;
	b=oGcdjfACr5YSSG6FdLTEq1AGQ0rV2ER1yXyHJ7qSUy+I3t1Hy+CuKEdJ4T3ZZAm24j0PZ1
	Vz/k+jccCL0+Nv6ELPfxjTtun8SyNVYr/1EtBK9z+uvFgTufb9/wVcr3HvKgXorcfanaXs
	PrCC1NlRvRSveukodxRReA7jTNX/ff1mYBlNAPyLMCASubz3IHWY+s48Kti7zTe1rLvUeB
	JnaB8pemE9T9z2k+EEC1ZCq0pRnOKB+2uY9HnULf17VURMmW3grqk1J8Exg7q1lXzVICBZ
	RaRDmDNXpxpv4YO5ullEYcx9u2G+lSazLvSOQWNoYYa9i+3UTlxd/w53qAfWNw==
Date: Tue, 10 Jan 2023 14:43:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jack Chen <zenghuchen@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jesus Sanchez-Palencia <jesussanp@google.com>,
	Mark Slevinsky <markslevinsky@google.com>
Subject: Re: [PATCH] i3c: transfer pid from boardinfo to device info
Message-ID: <167335818715.550702.4568478412316741935.b4-ty@bootlin.com>
References: <20230105212952.56321-1-zenghuchen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105212952.56321-1-zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_054341_308979_42AAE4E9 
X-CRM114-Status: GOOD (  11.37  )
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


On Thu, 05 Jan 2023 16:29:52 -0500, Jack Chen wrote:
> I3C device PID could be defined in device tree and stored in
> i3c_dev_boardinfo. It should be passed to i3c_device_info when
> allocating a i3c_dev_desc.
> Rational behind this change is: when users decide to use SETDASA to
> assign a dynamic address with exactly the original static address, in
> step of i3c_master_reattach_i3c_dev, this address is checked to be
> taken. Then device information retrieving step is skipped. As a result,
> though the i3c device is registered correctly, its device driver could
> not be probed.
> 
> [...]

Applied, thanks!

[1/1] i3c: transfer pid from boardinfo to device info
      commit: e826acc18bc7bdf4278bf8928caa3a0cd4065432

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
