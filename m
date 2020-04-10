Return-Path: <SRS0=mh41=52=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB775C2BA2B
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2020 13:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E46120CC7
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2020 13:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Er9na6Yh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E46120CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLrenSBoes+6cXJOZBSfdTi/NDUh52Pi3zbdrKdINkQ=; b=Er9na6YhbbHAG1
	0Oxem8RLGXHoln5u9k5SD7OmDrBhJjDBDWLgHR61jVzNNpBYBSS+KYd6GCZ8Zqw3YybFMbDYXHimZ
	1OoaxgTFPoHU9ArEk0fVEItNNQUUG9/6/Sxz8GRx+3Mt9VvG/ESS6dqyDJK3NN8cfG2ntbJH8ed3e
	s+vgxfzLYJSwWCi76LFQWzdShrcGpQbpb8o9OWAk+Mt+LccBt1TbaCjWshxdib9u4a67av+6swYfj
	MG6P63DV6hEeO56rVyEfHvtPZSl4Op0OR3LYnLfRKBRtG8uWKv2S8/Y63WTKRHNt2AzHfV83IG/pS
	UsEaG+DZHAc0lvgmsUrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMu0G-0001lB-0a; Fri, 10 Apr 2020 13:47:28 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMu0D-0001je-3a
 for linux-i3c@lists.infradead.org; Fri, 10 Apr 2020 13:47:26 +0000
Received: from [5.157.111.77] (port=57208 helo=[192.168.77.62])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <luca@lucaceresoli.net>)
 id 1jMu02-004cjm-LM; Fri, 10 Apr 2020 15:47:14 +0200
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
To: Wolfram Sang <wsa@the-dreams.de>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
 <20200312111950.GA1013@ninjato>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <62896a27-9df0-ef84-9724-2ff34b9bc9a7@lucaceresoli.net>
Date: Fri, 10 Apr 2020 15:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312111950.GA1013@ninjato>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_064725_311790_5B88FBF5 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On 12/03/20 12:19, Wolfram Sang wrote:
> Hi Luca,
> 
>> But the kernel currently ignores nodes that have no matching driver,
>> right? So in this case the kernel knows that that address is used, but
>> ignores this information and considers the address as available.
> 
> I'd rather call it "unbound" than available. See later.
> 
>> Seen in this perspective, we should have a "compatible" for all nodes:
>> it is just describing the hardware and could be out of the kernel
>> control. But instead of discarding all nodes without a matching driver,
> 
> And what compatible value would you use if you know there is something
> sitting there and don't know what? This is what this series aims to
> address because we thought a compatible name like "reserved" would not
> be a good idea.

The scenario I have in mind is when DT has a proper compatible string,
but the kernel has no driver for that chip. Could be not implemented or
simply not compiled.

There are 3 cases generally:

 1. compatible string present, kernel has a matching driver
 2. compatible string present, kernel has no matching driver
 3. compatible string not present

Case 1 is obvious. Case 3 is currently ignored, with your patch the
address will be reserved. Case 2 is currently ignored, but we have all
the information to reserve the address just like in case 2, but there's
no plan to reserve it. Why not? (not necessarily in this series, I'm
just trying to understand if the idea is correct)

-- 
Luca

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
