Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FCEC2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92A82078A
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRHwVP8j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YJHXYax3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92A82078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SIHcd+Fuypz+i+4SWkjEygRurvOkOUnY5RNWD0ZPv0=; b=CRHwVP8jlngTJp
	ZFcspzP2IfXZFFxULUz+VFHB//kU/i1gt2wUzgLmEHpcuXiE2R/HO4fU0IluUCffQ+1aOnrQd2S3d
	ohxovojTfpCVRYsv7iYBKFlc2jWkeG3n3EmJgHErrTAA/bFFW2aFi7EGS8a0Er92XC3HTWxn1iN6B
	FdhfpzFVS6M+DBWpmC3rGf0HFUvX/5R3Dw8V1mhiXZe1rKQc2GwVeMM603Qj4X7rMS6NgPrSt6drU
	FeAcddK/0yPRNsbvMdwYZ+QS5jbRK/IghyvK5pgr0NHgt6ENca69CmnYTYa4fYLH9PqafcFAl/wwp
	0SWrRKzaE0tdUEDFAqEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOdaa-0003J2-5v; Wed, 15 Apr 2020 08:40:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdYf-0001fx-PX
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:38:15 +0000
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81BBB2D1;
 Wed, 15 Apr 2020 10:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586939887;
 bh=m17M/qxOXVGsFQJ698T1Ff8MtF5x26XIRLZsnobAhNg=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YJHXYax3vn++WTEV3ZgsaAvu0Np/2TLyVoFAzk/SXaOkJgHeaTy+3qpw2qOZurZqX
 6IVPyXrZX9N8VJqLF0Mc5OTr6mZORtiKu6Q4+vFNM2DQJECPvFLsBVNmlTJrv7BPPL
 8UlYHHVmPO7J16i7Sm3gN5xiQO6qWFL3jtZ8+DsE=
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To: Wolfram Sang <wsa@the-dreams.de>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
 <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
 <20200415081654.GC1141@ninjato>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <dd627250-7916-8ac6-9a3c-316e0d7843ae@ideasonboard.com>
Date: Wed, 15 Apr 2020 09:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415081654.GC1141@ninjato>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_013810_006835_61FEE08C 
X-CRM114-Status: GOOD (  12.80  )
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
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On 15/04/2020 09:16, Wolfram Sang wrote:
> 
>> Aha, is it easy enough to distinguish that difference in user-space so
>> that we can present a specific character to indicate this in i2cdetect?
>> Or is that not so easy?
> 
> I thought about it shortly but have not come up with a way of doing
> that. This is the code in i2cdetect:
> 
> 	/* Set slave address */
> 	if (ioctl(file, I2C_SLAVE, i+j) < 0) {
> 		if (errno == EBUSY) {
> 			printf("UU ");
> 			continue;
> 		} else {
> 			fprintf(stderr, "Error: Could not set "
> 				"address to 0x%02x: %s\n", i+j,
> 				strerror(errno));
> 			return -1;
> 		}
> 	}
> 
> So, if we chose to use another errno to indicate 'reserved' and update
> i2cdetect, all old versions of i2cdetect will have ugly error messages.
> And adding another IOCTL just for printing reserved addresses neither
> sounds great.

Indeed, a different errno would be about all we could do - and it would
seemingly leave old i2cdetects with complete failures, if it goes
through that non-EBUSY code path.

Ayeeeee :-S

--
Kieran


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
