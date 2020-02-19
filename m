Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED20C34022
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 07:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D21F208E4
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 07:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USRTzbX+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwraLWEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D21F208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ztqy24v150XO6YgrsZGIvjXMuiH9/M2ZRqIZADWhQMI=; b=USRTzbX+uBzjbG
	mcJlP2nB5G4lzN+xxN87zyb+Bq3eF6A1XK0k4F40sHUpajEecUOJl05uq3fKo8h7V8m+I8bc0ymz1
	waCZaSBg1+BSUS0k3gQQcSG/AoQaZjck9LWQGzIebNm4d0jLoJxG4swoyA+tBHyYZm6Mo4rSoEGMB
	JfUBeJ/hpJzoTNerud3zpgz81lfVqXiNdv1xBcXSxJxGEgczbXwaBIrw9EXHr6lWzoPIH3xCm/LAe
	+vtoatcP1SoGBl/Xm072RiC+TzbNWqbpGi9lM79INs4a2/11I/3rHJW88AsF2NOSxRxauCYsYfXbj
	mExgBdLx9fpKj+h5vARw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4JxU-0005M4-CR; Wed, 19 Feb 2020 07:39:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Juy-0002s0-6z
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 07:37:13 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35FF1208E4;
 Wed, 19 Feb 2020 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582097831;
 bh=B/ZA3VaaY86Ch+VeIeHZ1KK6etb24wKrAlye/s2lurk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwraLWEhEJcUQKdiHq4N4NvZDDo4Ytp4HIKJkfYBRo0xDchl0kD6hgQfT0Pon2dPW
 zfKxTSe/xFvetiWvcJDSbZwqMfsoucH1ml1HD8KW6GjfucpQEevTFbwnCEFNaxoOIw
 cj7bnst12LSPm868uPMC/vJcVUAMiDdmdXzbVkmo=
Date: Wed, 19 Feb 2020 08:37:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20200219073709.GB2728338@kroah.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_233712_315981_91E81B4C 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 01:20:42AM +0100, Vitor Soares wrote:
> +config I3CDEV
> +	tristate "I3C device interface"
> +	depends on I3C
> +	help
> +	  Say Y here to use i3c-* device files, usually found in the /dev
> +	  directory on your system.  They make it possible to have user-space
> +	  programs use the I3C devices.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called i3cdev.
> +
> +	  Note that this application programming interface is EXPERIMENTAL
> +	  and hence SUBJECT TO CHANGE WITHOUT NOTICE while it stabilizes.

Hah, no, we don't get to say stuff like that.  It's hard to write good
apis, but once this is merged, we need to support what is there, right?

kernel programming is hard :(


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
