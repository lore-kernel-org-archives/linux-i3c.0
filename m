Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D242E77198
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jan 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83njIz/pWuqVs2UvRTIFjsbXxPTP5BzIQPz5a+x5BtM=; b=qSNDq5XKimpNSN
	xXCN+Gw0+FUsbG9sngHk/bTwpjpoZQl/Cks7ntr9Lc3jhZAkaOxGtCtwlLERlHiswq0s59/0cHsbW
	CqIhMAo+PU5ztxqqx56Ye9uoylONTl6vCCXZsqLE2L9HKnRA2XEgQQd4hEWtK5yguS4vp9AKrkIFQ
	KxvK9FoQFibVR26JPgKjtmM+9WeZJoMpHTfukYX3HzaT7O50XHc2CngS1zKyI5jow5Xv6E+GNpQyr
	QPS3/4gqIvWLYxfW1AFNjMAod2HXYfli+ed4sABkstEOz3DtGrg1r6dpeTS2rl195kkuUW7zgFiki
	UsjjKzaLz8JJY++dscjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjZK-0000000DH4y-3ki3;
	Fri, 03 Jan 2025 15:26:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTicD-0000000D6T1-3Qdl
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 14:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B25FC5C627A;
	Fri,  3 Jan 2025 14:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5548FC4CECE;
	Fri,  3 Jan 2025 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735914328;
	bh=9rkDFEkGJMZh9gqmxw60dXjoOQeA4ixOSDAGcEo3bgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kso0gLsOnKVaCZXGRozJqP9zLznelBJwtMkW0qURcHulbiBFW3jYDy/Gy8SHF57Gy
	 6F8K4rXBmZXia78C9mG74cJC2xuucC6P+6b88ntInL8wfSMj7F1UoiIDj/1TW3OqfI
	 +E7XWDjrZehRDdI/upmAXA4ncIlSV4P1uhcC+IFE=
Date: Fri, 3 Jan 2025 15:25:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, kxwang23@m.fudan.edu.cn,
	alexandre.belloni@bootlin.com, patches@lists.linux.dev,
	pgaj@cadence.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] i3c: master: cdns: Fix use after free
 vulnerability in cdns_i3c_master Driver Due to Race Condition
Message-ID: <2025010340-unearned-snare-fa78@gregkh>
References: <20250103070420.64714-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103070420.64714-1-jianqi.ren.cn@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_062529_896062_606B0233 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Jan 03, 2025 at 03:04:20PM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> 
> [ Upstream commit 609366e7a06d035990df78f1562291c3bf0d4a12 ]
> 
> In the cdns_i3c_master_probe function, &master->hj_work is bound with
> cdns_i3c_master_hj. And cdns_i3c_master_interrupt can call
> cnds_i3c_master_demux_ibis function to start the work.
> 
> If we remove the module which will call cdns_i3c_master_remove to
> make cleanup, it will free master->base through i3c_master_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> CPU0                                      CPU1
> 
>                                      | cdns_i3c_master_hj
> cdns_i3c_master_remove               |
> i3c_master_unregister(&master->base) |
> device_unregister(&master->dev)      |
> device_release                       |
> //free master->base                  |
>                                      | i3c_master_do_daa(&master->base)
>                                      | //use master->base
> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in cdns_i3c_master_remove.
> 
> Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> Link: https://lore.kernel.org/r/20240911153544.848398-1-kxwang23@m.fudan.edu.cn
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>

Wait, why are you all submitting stable patches again?  I thought I
asked you to change how you all did this AND discuss it with me after
you came up with a plan on how to move forward.

What happened to all of that?  I'm dropping this, and the other
submission you sent as nothing seems to have changed :(

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
