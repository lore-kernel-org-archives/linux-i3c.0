Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5F5D262AD
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 23:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZufMERvt2H26/NRE4VomgXvT/l7BlqvuK66Z9L8+nw0=; b=ndpTKVGyeR/Uk5
	WRosSSLWBZf6IGMsqS+5ghNwHruHJcS1E4ooHxHyvYt2k5nBXykU8IL2EzL5/opl3L1tLPlmedCmC
	58RHWnvFzjbtcNqlzRuKtlwLE5y83/6O0wdCczd+QFALQMXiKQ1yGwKqy/RF3qPIAxDuBuLEEaIBh
	QxHS397kXn+fpDwN9JUpxx1EyIYzCyC8lqfKjm5hfSqdqDikknqZlkp9ot36WE1zmWEYa5I96r7sl
	3md/h+7oSLJbdMb6eWCWaTRuimmo1v3Rdxrmb//NCjeGexsNiejbgjvwAs93ba44HAax5ez1jIM/5
	0L35FyIHJivp/Sd784rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKjy-00000004bbd-3fBa;
	Tue, 20 Jan 2026 23:02:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKjw-00000004bbB-0jqa
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 23:02:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD0B81A297B;
	Tue, 20 Jan 2026 23:02:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABEF4606AB;
	Tue, 20 Jan 2026 23:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19383119B01E4;
	Wed, 21 Jan 2026 00:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768950140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TreuwGMpIeYNk63GLZLQ3HNUc7bshFktVfXuohKMyLk=;
	b=ziqN87gurgQbp1p96wgTNmkOMFl190jML6BcP7b3M7lyN1f/95Z3l0C019oAf9+cTL2I+G
	Y9MPNUTmyxWqp1jyLFfnAVW3MAEa73RZvWrSzHx76ir8UuC90IRT1ZWakonw1QmhrrKBLr
	OkPqbowb590K+pf+Xut1ZFRud4njULwOl5ocW+wpx/dJydQPKHyGQO+2PpaH9X6vtLKPxA
	CrK97a61lSL0pvUEy+aPcPV7vvj8erOA8h1LimAmOezeD5mxjv6/d65o2ymswqhJoCASJU
	/KlhMb9BM7v7E77Z3lZ/GGhLrJzSd479u4iF3qy2O1c2iKgddPGMaaEpMtCw9g==
Date: Wed, 21 Jan 2026 00:02:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Frank Li <Frank.Li@nxp.com>, andriy.shevchenko@intel.com,
	carlos.song@nxp.com, fluturel.adrian@gmail.com,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: Add stub functions when I3C support is disabled
Message-ID: <202601202302180c990bfb@mail.local>
References: <20251230145718.4088694-1-Frank.Li@nxp.com>
 <176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
 <20260115171220.000001b7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115171220.000001b7@huawei.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_150224_372467_EFBA814A 
X-CRM114-Status: GOOD (  15.32  )
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

Hello,

On 15/01/2026 17:12:20+0000, Jonathan Cameron wrote:
> On Wed, 14 Jan 2026 16:02:06 +0100
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > On Tue, 30 Dec 2025 09:57:18 -0500, Frank Li wrote:
> > > When I3C is disabled, unused functions are removed by the linker because
> > > the driver relies on regmap and no I3C devices are registered, so normal
> > > I3C paths are never called.
> > > 
> > > However, some drivers may still call low-level I3C transfer helpers.
> > > Provide stub implementations to avoid adding conditional ifdefs everywhere.
> > > 
> > > [...]  
> > 
> > Applied, thanks!
> > 
> > [1/1] i3c: Add stub functions when I3C support is disabled
> >       https://git.kernel.org/i3c/c/8564f88df202
> > 
> > Best regards,
> > 
> 
> Hi Alexandre,
> 
> This is going to make for an 'interesting' merge window as I'm getting
> build failures without that patch.  I don't suppose you'd mind
> doing an immutable branch? 
> 

I just sent it, let me know if this works for you.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
