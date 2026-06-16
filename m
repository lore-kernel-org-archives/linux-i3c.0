Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF19CD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khOldf6AiVTP1IgFNiDFP9/gWwXCLmiy3J2kxvSINt8=; b=tV5ky1Wxle3Na2
	MhNTpBvovkqCyYkM7apGa5UlZygca4Y4zmqikuQgRLFuh+1p+FYK1EkX5lBI7ltqbCOR+9A0akSXi
	9PiVrBLBYlUtIP7cO6ZQYADa0pPfk+tSe9Xgmq/DXtNux2Mi2OzGSW5p2zLuCtA/NLmVj+bizsUp+
	E8/p+cI3X0suifMym7fl2WsM0XDRj0wfeG67Xfiuz1PoEye/SLYNQCpbId0Pyu+bsGMeeP1kHduCB
	39VrHPACOo3jJHk51wMSHcxh+LehqN8ax3lnTtHZnFX7UgE1gFOJ1D4SyYgSP1d+WaDLSVcHE/hlL
	UfRVudqrdi00s6QQepsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcGM-0000000GNhO-3wn5;
	Tue, 16 Jun 2026 22:28:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcGL-0000000GNgf-0M17
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 22:28:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 174EAC2BB35
	for <linux-i3c@lists.infradead.org>; Tue, 16 Jun 2026 22:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5595D601A9;
	Tue, 16 Jun 2026 22:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D59B106C9F35;
	Wed, 17 Jun 2026 00:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781648882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mGt6bHqTxpPwjsQVgTXMipympX5EUUU+nt3t6cQtXA8=;
	b=HR8g0DpRfKlRgx2ZS5AFAB7vcod3FDTgm82Yg1nwUGhIeFPHrpSbfEPdy9DqJiMhyd9XKZ
	pYkoAXfPRQaWj/ongQIjCd2tgmEDwxgvVgBxyytVs6/sjb+r20A730kKGLcG8DOgFuh9Qh
	ED/xihucLFHWktwox4NUVHtmUTrQ0LvDbsBrX31/jTHgkIu5RJDnIsaX6/rPVT9wpyN+Qb
	0VRNSDnHOVFTq+Nm5+ep2MXB6t3xDM3YyUmyth8PBaSmaXMTxHrxLSFnEuvhvDhvtdUJZx
	qxUyx3MCpbgIGVitbAdaOCOwzKKsZoIL5OEYPPz+LGwestHN/YYcHtpa0zaIQA==
Date: Wed, 17 Jun 2026 00:28:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i3c: mipi-i3c-hci: Use named initializers for
 platform_device_id's .driver_data
Message-ID: <178164876049.854146.7062876073193553557.b4-ty@b4>
References: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_152805_329586_7A5FB41C 
X-CRM114-Status: UNSURE (   6.96  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2026 16:34:20 +0200, Uwe Kleine-K=F6nig (The Capable Hub) wr=
ote:
> The assignment in this driver uses a mixed way to initialize the
> platform_device_id array. .name is assigned by name and .driver_data by
> position. Unify that to use named assignment for both struct members.
> This is needed for a planned change to struct platform_device_id
> replacing .driver_data by an anonymous union.
> =

> =

> [...]

Applied, thanks!

[1/1] i3c: mipi-i3c-hci: Use named initializers for platform_device_id's .d=
river_data
      https://git.kernel.org/i3c/c/678e9409dd78

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
