Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81402C77B75
	for <linux-i3c@archiver.kernel.org>; Mon,  8 May 2023 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPWNiOuPhFSjGTQNdizFaREN8UFz7eL9TC+bVX2/Dag=; b=OSkBDU462n7Ixm
	rp9NxkireDZ1mhuGabxfKXTLPNGeCbN2fR+HyZHHjTIejR/KY+ikIqr78bHM54ZYXkRkOCENZ911M
	W/v6KA6catgUnincfzI2MsqXNaNdiML9UlwPG3F0t1xjSXbS1TWCtnxcIhrpB93HznGrGZd1apC6u
	p2wn3LGukgosCNSuanKaOeaqhwpmIRz2iSs3u03UbFN5DwaRnRlwph7ojcUpBXlkAA1z1uSVUqnTl
	V3qB725yEEN3BII1AzVJZATRlKy3Y/XkKFE762wZQt9m+kN3NkVIITgo3jqZfV10eyIc6k00D0ese
	YnnU6othO1RGaIdGGkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwAVN-001jjj-2N;
	Mon, 08 May 2023 23:42:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwAVL-001jgY-10
	for linux-i3c@lists.infradead.org;
	Mon, 08 May 2023 23:42:56 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7495B20058;
	Tue,  9 May 2023 07:42:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1683589362;
	bh=1e4M2KZlD62yYSkS2KzC0oTFDQWYEJc2i3RI0PDCWRA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JWNlhsBZmRAf76b3ERnGyb/c5vxwOAvBQ677He2S6p2cxBrjkChTmXa/qLdBROEZB
	 IccFSi97EAPFsuPP6qBUZSjXDYpAlnJLj7YY6EzMxnfvzWFtNrrnXpCczMent3xbuY
	 sD16sa5cjWpflQyLeSc2i3PzLPtGcioP6nih4+zjYtj9B6jymOx8x5dyH4cJ9qt0YE
	 JfzJLd7iGg8ZZJI4L9BPO9RuACPCQeC05yWRKhB5UKJYVIRKBA4WHcPRTq7XlStMSn
	 Vu0q/+40BW/RkycbUiPBALpMJiTUSlcYoFRmq1wQgUB2C5e2cGjtrShpKfWt7bK28L
	 qEHu/sr1eiHHA==
Message-ID: <4127aa2454a33bccf666597c292943ded9ccaa5d.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH 0/2] I3C MCTP net driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, 
	"matt@codeconstruct.com.au"
	 <matt@codeconstruct.com.au>, "linux-i3c@lists.infradead.org"
	 <linux-i3c@lists.infradead.org>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"joel@jms.id.au"
	 <joel@jms.id.au>
Date: Tue, 09 May 2023 07:42:38 +0800
In-Reply-To: <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
	 <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_164255_571210_13D3BEC2 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Iwona,

> Wouldn't creating "mctpi3cX" network interface for each I3C device rather than
> I3C bus be a better fit to model MCTP over I3C?

Great question! A few reasons for this structure:

 - it is a closer match to existing usage of network interfaces and
   remote endpoints (say, IP, CAN, etc): you have an interface for
   representing the local hardware and stack state, which may provide a
   path for any devices reachable through that hardware.

 - a simpler addressing structure: you only need one *local* MCTP
   address (EID) for the whole bus, rather that one per remote device.

 - the presence/absence of interfaces is not dependent on what's
   connected to the bus. If we used a netdev per remote device, users
   would not be able to set up the local stack until a remote endpoint
   is bound (ie, userspace would need to configure every interface on
   i3c hot join). With this model, that stack state can persist over
   whatever may be happening to remote devices (unplug, reset,
   re-addressing, etc).

 - if there is ever a proposal for broadcast messages in the i3c
   transport binding, we would have to re-write it in this structure
   anyway.

> Why are we following the mctp-i2c approach rather than mctp-serial?

mctp-serial follows the same model: the local device is always present,
the difference here being that no physical addressing is required.
Routes to remote endpoints are added depending on remote endpoint state,
but the local state is preserved regardless of what is (or is not) on
the other end of the link.

> This would also simplify the series, as we would no longer need "mctp-
> controller" property, and the driver would just follow the I3C class driver
> model without the need for notifiers.

It would simplify the series, but we would be punting a lot of those
complexities over to userspace.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
