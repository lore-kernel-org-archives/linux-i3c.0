Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9806CCF9E2
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Sep 2023 23:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCdzGpAEUqfiO85t8zuM3by6QOUTqNpLUB/P/mMbqHA=; b=29hPD8aUInR4gz
	DHF/uKYGfGZ2cNfKkVCltFdtbReftrzCVbEWuJUukQSPvB3iM55+RfNj0HKy3A6uq2vSR4f4AKotr
	YFpLrqSwDcVF0ip9wRkxLLsaBJ0Uu7PeVRo40+iN1qdPCoRlgcKfqncJoLhDrKcMFSW/Q1hcYq/vL
	zTRM5Ol1ipCLTHvkgYTKLH6grMh8NGvSzWkAQDd8FccKafHsEPmjpGe0+d0L1BNtX67tnUDnK2q2W
	rNKtaxqTMxgKgavJ79bkurzsqqUN2UWbBWOUpFq2HJkcqEcadMA5BZq6LTJh7SOcfOZ0sg+vT9KwK
	k2ye/AxF4yu6ByPhLLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfNn-006tBS-0C;
	Tue, 05 Sep 2023 23:22:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfNj-006tAe-1s
	for linux-i3c@lists.infradead.org;
	Tue, 05 Sep 2023 23:22:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A7AE1BF204;
	Tue,  5 Sep 2023 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693956164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Z5k5pcEAmV+x04SFylcHWHzG1422bRUlUrcZZqHpFs=;
	b=duTfldYCBRDx3ye6CtIFuo2m+CXefBdkyyozx5RcPYVEHhDjOLtW7WVfnry78hR3lKoO5G
	g4brDe73FyZ5qBp/lTvd8V4AJ1wDYosulJ2poI5NZLmiBXgzw2FcWJ04CPXmBq4xxWlIfh
	Z/YeCVORyvtE2qnxhyxG9EOZblDyJYvN07jiq0My1ftDVRmqIe/Kwi3kapag0+YyB9UaZB
	LWeEk1gPxdosjjK8Cp1fk1yL7eZGKDQPX71sjxLHmSD1yY/RwgCuXgTW2XeTqX3aOsOWav
	BKSbJji2EUudDwImspqAi82ImuGhqtW2IgHL3cQY/UqVxBY1KMCSFLtSaDgmqA==
Date: Wed, 6 Sep 2023 01:22:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <169395611478.302281.14031067702798801687.b4-ty@bootlin.com>
References: <20230831141324.2841525-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230831141324.2841525-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_162251_912376_CDB7C52A 
X-CRM114-Status: GOOD (  10.25  )
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


On Thu, 31 Aug 2023 10:13:24 -0400, Frank Li wrote:
> I3C masters are expected to support hot-join. This means at initialization
> time we might not yet discover any device and this should not be treated
> as a fatal error.
> 
> During the DAA procedure which happens at probe time, if no device has
> joined, all CCC will be NACKed (from a bus perspective). This leads to an
> early return with an error code which fails the probe of the master.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: fix probe failure when no i3c device exist
      commit: 6e13d6528be2f7e801af63c8153b87293f25d736

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
