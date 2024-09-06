Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4814CE6FE2F
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Sep 2024 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQjm3jQOm/XJl9Mdc3VALpP5S9cBAbAJmfWsx4lKAho=; b=uBL3d+Rnynvbpa
	IUNUyEN6Lj/oqcrBG3wx6mhJbZzeeQgPNv6d9HJ5U9ro6aIUwdn97yd5XOg9teYsiGs5qr+d1f2U1
	4IQ/mbYZa2dnvDWve1qS8t+BZno8Z8HIAaUPBXvSt/CGIKND7LBMACM2q41dM49wNr94PBl+nMJIH
	51PQuAMtUNQFj3t79Orqf4U/XkR4UgzeFcDkkacZGD2zkDRGoVR7dFyE+7nSjtMpTuumHatLuz9A5
	YH1+EECp4VOU100JwLz17JXPtockqbCD1Mh2gj6wqqOrFA5xr8v24akugfDsXJytOU5AgHOfBDWV2
	uQ1JbllbMgY95yq+ZzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbEB-0000000CqBW-2My1;
	Fri, 06 Sep 2024 15:50:27 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smb2r-0000000Co1o-3Hw9
	for linux-i3c@lists.infradead.org;
	Fri, 06 Sep 2024 15:38:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C8591C0002;
	Fri,  6 Sep 2024 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725637123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4phgVOTHCmQ3HBq6bcLfhgvUwM7d3HDKaPMvxrXCk/Q=;
	b=l1v2xZcSrhrOOhepIqsujTu+JcDkvfDxPR2ZTqv9TLjv6Zu9jlDJ6URgzaKXz7LYBsUkdv
	UiWik8Mc+TWNn27SEs/p6LTtRv2M+BbONoPgAZhdubWq1BG/j556B6m+PN572HTkM4+gRK
	FQTff8BZynFBvu9hfpf5hjtzrjCM9WEIISoN81q6e4DsYScRrQb3G/Qq3rxu04MLNUPah3
	why0z5fepADZvgtXEnZMFWElV3wmz2KFwG7EPNql87bjdYByz/Y8JqMw8UxlyoNQXMxFYt
	1mSIej2j+hZwtavetQvLgQQkntSqn4obvTxRxVKxJkSfPXtYZCprw/upgkhi1w==
Date: Fri, 6 Sep 2024 17:38:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
Message-ID: <172563708354.975422.17313525144371866545.b4-ty@bootlin.com>
References: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_083846_180179_BBDD755E 
X-CRM114-Status: UNSURE (   7.70  )
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

On Mon, 26 Aug 2024 11:38:21 +0800, Billy Tsai wrote:
> Based on the I3C TCRI specification, the rules for determining the I3C
> mode are as follows:
> I3C SCL rate > 8MHz: use SDR0, with a maximum data rate of 8MHz
> I3C SCL rate > 6MHz: use SDR1, with a maximum data rate of 6MHz
> I3C SCL rate > 4MHz: use SDR2, with a maximum data rate of 4MHz
> I3C SCL rate > 2MHz: use SDR3, with a maximum data rate of 2MHz
> Otherwise, use SDR4
> 
> [...]

Applied, after fixing the commit log

[1/1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
      https://git.kernel.org/abelloni/c/061dd21ca712

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
