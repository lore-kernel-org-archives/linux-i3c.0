Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF8C2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A859A20784
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="doagmHXL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UeOoK6zh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A859A20784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLj2BtN1oKnGsvJbP8U4CRl0qx7WvE84bYkmpyHFLHg=; b=doagmHXLJGiT+O
	JogxEK9Ja2Mr741TuoUBx40Vp/J3sscJ15d0M7VXLMfFFTp3FSZVby8fEi8L3+YzHF+S0lXgqqFWX
	6xB9ssUp+Ze5SlTUUEqdBcwdQJvi89oTD+D2+cVsW4cRn87wkhZJU4r+pN6lyrO2+GjpMI+tTlH6y
	g5Hc5Aq9uhquFNp/ckTsRMdx8kfw0MD7qYMjz/rZPi1ldZC+Z2hChQG7BLXX2q8Cl+Oelu9JV4xb1
	2z8HthMewSb8Gw6iXJPEs6zR5+MdsY3LTAM3Zpm//3PQN74ocRVJVaeOW1r0zmbC2nFSH/bANqTIt
	YYWaBEzdyKJmIBn2A/9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOd5g-0005Cz-Bw; Wed, 15 Apr 2020 08:08:12 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOd5d-0005BG-3I
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:08:10 +0000
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D67E2D1;
 Wed, 15 Apr 2020 10:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586938079;
 bh=d3cM3Q3qHFbLBztwm4kDpHyKueuNUZD1Tu5L0584nsY=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=UeOoK6zhCEGPmWLfhjDbfahqvS6Qzqp2JDYPHFhNseng8pD8GWoA8LBLcfgqV8B0d
 FgdG8w1Y9HRgqoqn2TiLL/xE0BFME9xvY4VZWRmo4zLoJ2Z+SGoMKKSGLBNy4sGABS
 bcUJCRW8hGIv5gCmFr39QrbNGoYsl5bInOrGZepM=
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To: Wolfram Sang <wsa@the-dreams.de>, Luca Ceresoli <luca@lucaceresoli.net>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
Date: Wed, 15 Apr 2020 09:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415075911.GA1141@ninjato>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_010809_290135_E8C5DFBA 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On 15/04/2020 08:59, Wolfram Sang wrote:
> 
>> As I said in the reply to v1, I think we should reserve addresses also
>> when there is a compatible string but no matching driver, but this is
>> another story and can be handled separately.
> 
> Unless I misunderstand you, I think they do already. Note that
> only 'i2cdetect' shows a device as busy *IFF* there is a driver bound to
> it. The internal 'i2c_check_addr_busy' does not care about a driver
> being bound. You can check this by trying to use
> i2c_new_ancillary_device() with an address which is already described in
> DT but which driver is disabled.

Aha, is it easy enough to distinguish that difference in user-space so
that we can present a specific character to indicate this in i2cdetect?
Or is that not so easy?

--
Kieran



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
