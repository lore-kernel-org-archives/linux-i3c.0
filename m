Return-Path: <SRS0=k+Rg=4Q=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D9EC3F2D2
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2020 12:12:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93B224677
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2020 12:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/qeeiXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93B224677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiXj9W8laQttG0T5FwccAaZEv4uh48dQ9QHXayJJJw8=; b=h/qeeiXKZ0hHT3
	3DMdJz4FszEqrKBJJEQCwJF4qRISEvAeQ3oyqjbiqQsgeNqe+hoMaF7UaeocheqX2tTyGHDsQ0yPA
	DRwqnEYI6HahEVUr3iXQMR6Mi8/+k7K5VRQd47mKpXDs/13k2oxNNeEo9CuzEARN+RDApNsc/HK7u
	pA35Ov6fzXiaj3hgRA/hsKqpRI5fATcppzX01NcCkTRcCBWKzaz79ZXiWIL6w06FVGDJXlAyCTN9T
	Tb4diCXlc2Ij0Gn0rZFjkD2MOC7qOl3k8X7ZsKy+MbmaOg/VV9+x5DqhEvZ8Xj7feKfZm/yuZb6oB
	F9SYZKYz4LRF2jXqubxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7eV4-0002vQ-JT; Fri, 28 Feb 2020 12:12:14 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7eV1-0002tc-9v
 for linux-i3c@lists.infradead.org; Fri, 28 Feb 2020 12:12:12 +0000
Received: from [109.168.11.45] (port=49166 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1j7eUh-001wPs-J2; Fri, 28 Feb 2020 13:11:51 +0100
Subject: Re: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <5bcda563-cbb6-c615-58fb-1f0fe9ed4c9d@lucaceresoli.net>
Date: Fri, 28 Feb 2020 13:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_041211_503045_A1DF886E 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran@bingham.xyz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

On 20/02/20 18:24, Wolfram Sang wrote:
> Back then, 'reg' properties in I2C DT bindings only contained one
> address and this address was assigned a device and, thus, blocked.
> Meanwhile, chips using multiple addresses are common and the 'reg'
> property can be an array described by 'reg-names'. This code enhances
> I2C DT parsing, so it will reserve all addresses described in an array.
> They will be bound to the 'dummy' driver as 'reserved' iff the first
> address can be assigned successfully. If that is not the case, the array
> is not further considered. If one later address of the array can not be
> assigned, it will be reported but we don't bail out. The driver has to
> decide if that address is critical or not.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
