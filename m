Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B40E7719E
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Jan 2025 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyu5x2Bx/McwYfsJeKOZbaF/kpmbbN62rHES75rqcLk=; b=SDeKRHRlzQdyYG
	4/rmv6X+aXe8ASvgzfnJ879lsGDU584XZ5o0o4migMyH6Jtg3cOfK0TcgFFOF2ZuQfiF6taXKbmSo
	7ZFWcLNeokTN10hSRp1c/uO2n/iAMtdJU5AAm/IAGP4unKBnzvSNzKNMhv7Wkfquj2AXwpa5botmh
	gKnBAMk1ntLRhFuDYEpMBZCWuQGz8x7hEJgdmkLM91UhdiOfueXQBqS9k6SK1hCNLqpe69Y8qtSo3
	Cj7oPmCT3N7zn02TDKoFFGLJFUOD87G1GfU5emPUjFRq+F3GtIHefCNzg5S3Y1jjAN3oW7NIDQhus
	v4lY3sBEHsM7vGhy5f0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71l-00000003aaX-1f8Z;
	Sun, 12 Jan 2025 23:05:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX70g-00000003aPp-1rQM
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 23:04:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1443FF803;
	Sun, 12 Jan 2025 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClLztbhudflHf1BTGMND+rv21TzPzRc7fxZhF/wvn6o=;
	b=d6KOfBwKki0Y6ZbYU3kvIMs4NPEVAfxe+RXwkmEtQA1fsleVOWaUGNXuPJP78lz+eSuGuT
	6NeD2kV8fDp33LgMYQUSCe+f4eovDXlMxY3Rdwcc9GLdrVNjS+QS1f17j7h8vCGCiHOhPm
	cl8UstQ+L4QWuRtT4dCoqOXUnLlMQXCnKWKp1DZia1zk3+fsqGNxIWKQb/JDpKCiXj0K1Z
	bsabS4AEUiBkgWJ5LVICAOfGdduDK1wgOHgDypQovWIb+EE4l1omgwvwIOOcEUPruQm7EB
	tX/DE+v3q5k0xw92rD0+nX0pd+XqCYjqHCqh9PBIvXYu9cpS/xeLkuUzHITpZg==
Date: Mon, 13 Jan 2025 00:04:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
Message-ID: <173672283107.1485431.13798572959032864238.b4-ty@bootlin.com>
References: <20250108225533.915334-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_150446_622000_1848A85F 
X-CRM114-Status: UNSURE (   8.43  )
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

On Wed, 08 Jan 2025 17:55:33 -0500, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
> 
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix missing 'ret' assignment in set_speed()
      https://git.kernel.org/abelloni/c/b266e0d4dac0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
