Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80BEC4332F
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Oct 2022 21:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUJhX8P9ppW6VXZKp1iKZDucCNlITuV+JQQcoMy4nJg=; b=kC2/hvlGspfO9u
	KOJw/nn8dKILkF7iNLxRwmsqk50kY5eu9AMZou5xvSDyd2EzyVC+sn4+5ofTtU9lN5ZCMVv9rS6x7
	T9J/jMj3v/BT8JCg98pR0smxjssp10HlLQD5YRzdVKIvR+AuFUjswq4z9fcCtZrRVKlWdksxaPQ0n
	ul96AcxlzdeLkwBS2VVHmkJ9bjsmpjqlPWm786TwSnEQEjhKHvu+BWtKGoQehos/Pl2/FyCbEj4HO
	/crnsgcqcosuUf4iZV8U1HowCbCCSvX2g2q/JEgTUofxUAEAMtX8FPb/6R+bUfScKGekh9CKeLwHg
	+K6qk6FMfcGPpo1b/52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oijZU-009S8o-K2; Wed, 12 Oct 2022 21:47:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oijZR-009S6f-0c
	for linux-i3c@lists.infradead.org; Wed, 12 Oct 2022 21:47:23 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 124111BF207;
	Wed, 12 Oct 2022 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665611235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PYRXTnYlOIai//bTBVSmjPYeweD1Rg8CDON7kToZxqc=;
	b=mDRF+yzSENuSMTSuohsAgbDIO8I03+JnWAJC3whECcSRQ7fLSjk6AtB0E2K5wOnrs31hRn
	u9Ljp6WgXUq1nZqVaxPlZPh+h3dbRoDeAUmM7BX/mfS+JlXhnH5n2pUf36uGxZRq2I9cWP
	jODLi3GKCCQbXoeAsgrP5J1W5LP7n06uaAVZtCtDm+RPD3OfUe20jLXpPaqM6dXSj4ZJGG
	KUfCFOLlaLE6zsDLZluXSXq4RqcmBJL3lD+l8oyO9QcxW1Jl5Cb9Vz4CiT6zP6Gn2aXjFJ
	OgHuHcGJx64aXwPmAM2O+P7dkAxzcKt3mfUo5MxHWEDLAVf1I2PjNcilxFy+6A==
Date: Wed, 12 Oct 2022 23:47:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Billy Tsai <billy_tsai@aspeedtech.com>,
	BMC-SW@aspeedtech.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/2] i3c: master: Free the old_dyn_addr when reattach.
Message-ID: <166561121428.1047719.12420586269753157995.b4-ty@bootlin.com>
References: <20220926105145.8145-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926105145.8145-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_144721_394853_126F3934 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 26 Sep 2022 18:51:44 +0800, Billy Tsai wrote:
> This patch is used to free the old_dyn_addr when the caller want to
> reattach the device to the different dynamic address. If the
> old_dyn_addr is 0 the function will treat it as no old_dyn_addr is
> reserved on the bus. Without the patch, when the driver reattach the i3c
> device after setnewda the old_dyn_addr will be permanently occupied.
> 
> 
> [...]

Applied, thanks!

[1/2] i3c: master: Free the old_dyn_addr when reattach.
      commit: d4fa7d772adc02451076b3ad1f990d8b822909fc
[2/2] i3c: master: Remove the wrong place of reattach.
      commit: 90f4a09a15239f4a819b2e90a7a0b92a75060655

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
