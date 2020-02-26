Return-Path: <SRS0=Ht3v=4O=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6270C4BA1E
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Feb 2020 17:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B57D24680
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Feb 2020 17:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="crdP9dRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B57D24680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CQ24bqOiM99jKlzvsNweqWK2FeB8c5k5WPn/5cyP1Y=; b=crdP9dRhGkil/E
	+gNm685xkGHTBsQG1n0VpgmrXJFUmjadI+qjGhvFUQogRBg4nzrNSvXG/4cTrs0EL91TOFP35GmEg
	X1bmVBRyBloQge2B7bTCD7Y7LNf4olC1vW7rYtAhHSwlP37Y600pf3H3z7s/WmT70FwWRlU8fO451
	px1Zoo6a2cNO9anvU1PabwVxQNCNLzFDTyz70VJhovISpCabARFKfeGNdbz5lq5En4Epqyc24zBmA
	2lWubRENPu9M7izO8k5KDrCHf4ks9yip3ddsycO9LI2JiUE1+3WFZFEnvUc7+AVhh5laobNMIW1hX
	F7XIbo74sqotJgIWXWxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j70cu-00058a-1i; Wed, 26 Feb 2020 17:37:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j70cq-00057d-4M
 for linux-i3c@lists.infradead.org; Wed, 26 Feb 2020 17:37:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD4F0260C2B;
 Wed, 26 Feb 2020 17:37:34 +0000 (GMT)
Date: Wed, 26 Feb 2020 18:37:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>, =?UTF-8?B?UHJ6ZW15c8WCYXc=?=
 Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>,
 linux-i3c@lists.infradead.org
Subject: Re: [PATCH 0/3] i3c: Address i3c_device_id related issues
Message-ID: <20200226183728.74df26f5@collabora.com>
In-Reply-To: <20200222102711.1352006-1-boris.brezillon@collabora.com>
References: <20200222102711.1352006-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_093736_303450_91C11099 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 22 Feb 2020 11:27:08 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> When the I3C subsystem was introduced part of the modalias generation
> logic was missing (modalias generation based on i3c_device_id tables).
> This patch series addresses that limitation and simplifies our match
> function along the way.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   i3c: Fix MODALIAS uevents

We also lack a modalias sysfs attribute.

>   i3c: Generate aliases for i3c modules
>   i3c: Simplify i3c_device_match_id()
> 
>  drivers/i3c/device.c              | 50 ++++++++++++++-----------------
>  drivers/i3c/master.c              |  2 +-
>  scripts/mod/devicetable-offsets.c |  7 +++++
>  scripts/mod/file2alias.c          | 19 ++++++++++++
>  4 files changed, 49 insertions(+), 29 deletions(-)
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
