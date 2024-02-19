Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68100C48BF8
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Feb 2024 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGdP6UdNU2Bt0inH4iv3wFmXwLHd/pn5FLfjx07g3KE=; b=AZH+j6vQHWZs5l
	dLmN6BzsjX48MKOAOhO+VPEShxaVwgjB6bSRcIJ2FjJLMkIk+SOKezXdw9By5UoX8ctxc0qbleog5
	DrZn1nHPdY7Oftyu6iGAOcdkXovb4k81mZE6lI4KvpIbHDYYATr3bBBFE68z07sgtXxTca8EIQ3DA
	qJX5Km8Cc1+Xrsl3sk9j5ledybK2OTRe8mwt7d7UyIcBtKy5iWrkZb9i7FybXCQ+PNxEgoboZmQR5
	mO6CqoTZcZkZRCD1oBsst0r3xNb2ng43B8dIKDgqz0dgaY4rGMugGypg12+wcXHP8GaJlSTnHabJm
	iViQvRGWQEzy5dPLtNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcABE-0000000C4lR-0LL0;
	Mon, 19 Feb 2024 20:24:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcABA-0000000C4jV-3qYC
	for linux-i3c@lists.infradead.org;
	Mon, 19 Feb 2024 20:23:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8B11C0005;
	Mon, 19 Feb 2024 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708374234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ENwTirO4C1/iRzyEhoHRKBL7ZzGNHVOtywGsyH0UrIA=;
	b=XlVXn4l/X4q8IHBmOu1XGQ9lVaMpOyIYlWmIOpEQT0m3wUU15omjmsHqZ62IkPPWy8AXBs
	ceVJM9GQ6B7StPLaBzaNQ7wr/PKKmC1LMxFalwD1PSug6zFiFg5X9YCaZsOAWfIsyuy3uF
	FUV5oDSCnC07JtUT+WPIX2+XJghhiYLVOIdV564py37m0O0Gxan37f6uon5dSO8iT+5kLB
	2cDdRu9ZA5uL2UNoo67zowCJ7tK7FAPnNfL6ahW5tW6c9eiNz3xX/r4Q8fPcL71RA8tDf0
	YO6HV67lQcopiHV3sS6n3zgDGmiXH33ueQEJDMgftRd3KXhXX7h65gEF4P+uhw==
Date: Mon, 19 Feb 2024 21:23:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] i3c: Make i3c_bus_type const
Message-ID: <170837422443.1277872.13909189733337460411.b4-ty@bootlin.com>
References: <20240213-bus_cleanup-i3c-v1-1-403aea18f05a@marliere.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213-bus_cleanup-i3c-v1-1-403aea18f05a@marliere.net>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_122357_122736_DD7C7656 
X-CRM114-Status: UNSURE (   6.94  )
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

On Tue, 13 Feb 2024 11:37:31 -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the i3c_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: Make i3c_bus_type const
      https://git.kernel.org/abelloni/c/8f06fb458539

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
