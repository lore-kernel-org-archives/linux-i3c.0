Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF43AC2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D8620656
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEiAD+vH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h0LSZW1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D8620656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRK+M+19MdNirGgTjsgHPkVbTtE4Wreeb/Y2sUqAkoA=; b=UEiAD+vH+eskYn
	MTgJRV2J0OfmZFuhRacbG1YTlTle8rvD1HZiqZ0zbj7YEpZcGv8P8RWmGWUIkRWCyPQ4X06b5WxWD
	b2f56hU5HNXCjmTwxFze0sAj4vXwA5/M9Dp8b0/nU7KJTenYVJb3xkNlvklxSf2nuAemAiJioSjzl
	PXGQo38/8nocrU70mnC9XPhd91epKeB2DIyXShwpHJgaXnwlSXEjHkBcoc0ksN/eg+/dqpRw5og2z
	sx4t47uzdQcPiMsFCQRaoBbVVXvQ2EJRpyiZkqBTTWqmCbv9PTpuwJLWdVBHGKHlXv6DQL0yBFayz
	BGgM11d5XF/rOTFNeqvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOdVt-0007q8-5s; Wed, 15 Apr 2020 08:35:17 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdVq-0007C8-DE
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:35:15 +0000
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 757872D1;
 Wed, 15 Apr 2020 10:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586939712;
 bh=rbh9fDJeGinm28yTtw/ldq3r46Kaxtu02L5LD4eqf0w=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=h0LSZW1gDFztRj1QogbWoO595f3fNGjGMf//QtE7Nbz7MLRlB0uCSbGZlAiZy14jd
 qa09cc7B/nW+lixcv8OniFCgJJp7P95d+KSl4RLFT55X8DmH3C1m8H0IrQ5Bjp/q0z
 nqFu5AmQ24MVN7dfhmeg7fzLHsSzLImptFrcFbaA=
Subject: Re: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary
 addresses
To: Wolfram Sang <wsa@the-dreams.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200415082712.GD1141@ninjato>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f214be03-4617-40ed-40f2-019e4fd24cd4@ideasonboard.com>
Date: Wed, 15 Apr 2020 09:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415082712.GD1141@ninjato>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_013514_618527_344B4D5D 
X-CRM114-Status: GOOD (  15.59  )
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i2c@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 15/04/2020 09:27, Wolfram Sang wrote:
> 
> Status update on this series:
> 
>> TODO: make sure there are no concurrency issues in patch 6 when handling
>> the struct i2c_client.
> 
> This turns out to be annoying. How to make sure that we don't modify the
> i2c_client while the adapter it is sitting on just gets removed. AFAICS
> we need a new locking scheme just for that and I am not convinced this
> is the way forward.
> 
> Also, there is still this small room for regressing when there are DTs
> having multiple addresses specified in the DT and the drivers use
> i2c_new_dummy_client on these addresses. I have verified that no in-tree
> users of i2c_new_dummy (and friends) do work on extra addresses but
> still I'd like to completely avoid this potential regression.
> 
> One solution to both problems would be to unregister the reserved device
> when its address is requested. I am working on this prototype currently.
> However, I am not sure yet if one issue might make this approach messy:
> re-registering the reserved device when the probe of the requested
> address fails.

If we 'unregister' the existing device, could we then register a new
'well named' device more appropriate to the driver, so it doesn't
continue to show up as 'reserved' in the system, but rather a more
appropriate name to the driver that registered it?

> We will see...
> 

Looking forward to it :-)

--
Kieran

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
