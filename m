Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DF0C001DB
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Aug 2023 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAEiGOuG5GAlzaKA10trRQPmSE7DpBM3yPX+UGdMxNM=; b=gtZZfOcF7jxdhS
	E+ng5IYmC0nU/Fi+ndIUa6hvD5wZX2Uz1U9k8Z3Xyi1GWLYDfDSjUneiV9GOWl2VQsnHwOmx2k+/m
	uvOLCnM7CsesX25+OPvBM9PAmncwDo9sGcnSx9C0KEAD1U+L/z1PWl4PZRNaGvJzjUl1dG6CE5Xum
	C3+I+yhceN+nvBBnfYe8MKkzNW2TizHvu4bu/x0iNT+YoU+yTgygd8CNPj3lo9ispsMhjghM+k6hI
	dfpU6sE6v6/v72AQZVTDvirCE4J4eKDtfZA3MzGqxwmAvGgdOC70WIqrNuPCjrtl05A6+EIBUHWQa
	wdx2y6U11CffC4uY5ajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0nR-006q5H-35;
	Thu, 10 Aug 2023 08:13:29 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0nP-006q3L-0h
	for linux-i3c@lists.infradead.org;
	Thu, 10 Aug 2023 08:13:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C66A1C0006;
	Thu, 10 Aug 2023 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691655202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ozyNcT7zbaBU0A8m77F2BWfUC+pSE4QNPLCSjCgYxbc=;
	b=JVW9s6ttNtLfShO/906jjCIK/ms5GcGJBHzyTAOlEwcVNAIaRwp0nbMqOblTWgtn1nmWd8
	sEhwD0tXJ5357K4HcOfIGoF8+CQ1rZuFizEC35kA6e3QiZDl7rrTdvtFUdUsIxXfRxWjx8
	RBNuIlPU7TvjeQGDbXZCTB9IYKuM78B1/l1xK+nbO7Jw05epje1cVT+H2Zczp5zsjgidPQ
	/7wOKUP1iGrV/wgXc0mors+464tunmpmR7mTZLKUC6JCQzX/mikifvAO31h7ULAPRNuQC6
	spu9iINwXfw7dQu2Zbx/+6rLjMNIUwj7sbaGEfcPl/y9LlTJdSZSVdCW1NDSbg==
Date: Thu, 10 Aug 2023 10:13:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] i3c: master: svc: Do not check for 0 return after
 calling platform_get_irq()
Message-ID: <169165518426.989932.4311192647570957813.b4-ty@bootlin.com>
References: <20230803085149.149248-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803085149.149248-1-ruanjinjie@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011327_401821_53D01BB3 
X-CRM114-Status: UNSURE (   6.19  )
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


On Thu, 03 Aug 2023 16:51:49 +0800, Ruan Jinjie wrote:
> It is not possible for platform_get_irq() to return 0. Use the
> return value from platform_get_irq().
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Do not check for 0 return after calling platform_get_irq()
      commit: 300098637900f7ff99cafed2be7221407b82df83

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
