Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4169E6BF3C
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHk1DNE+S2GF+Y9hzQ6rn7z/wHBVH1TCo4No6VayKdU=; b=RAv8lcLrm5dGeQ
	SPzJhT5AAOlsQpa6Z60JxtuN+mLA04B85UV0CKRqb6tQCiGP5bRyXyDLD7C2Eh3Z8j/vLGq+3c0e/
	nQUBgd7OOUOj2iaoYwwVwNq7qff8sGoIpMx6SrT+/kEstVwORvKrRifC5/E0TkpiwqUdgSLzClivf
	3N2WuVonmsz62juM0/VUX3boI8wE8+d68NOfTRh7N0Jd7Js82Wk3vR+Y7X2brP9fqDufcP6ohO9Kc
	1BuRjcfjo7zvLhdH0b0R+h7W2/kXfsBXsWLhS3mEp9/TIVj0Fy6AwjzxCTc7JlsZ9uCUGeDb60hIs
	SQUsRfD+YwCG2Sm7KopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbE-000000025NP-2lFP;
	Fri, 30 Jan 2026 23:08:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbB-000000025Mk-3Nn2
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 23:08:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FFE0C22F6C;
	Fri, 30 Jan 2026 23:08:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2CB86075A;
	Fri, 30 Jan 2026 23:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DE6E119A88BC;
	Sat, 31 Jan 2026 00:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769814488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=rCMUusw1c+tcT0Y3K+PyunO40KQj+/2mUST4HcpET2o=;
	b=cGSQvPDpn+DIbud5IYIJLo2kEzCStxZL38l1bNWp2T+uGXyQv/HuHu5G9DXDPaHQJETZR4
	wljD3OkmCs8t3amEaGQXMCG6MgY6nTAKUtRJ4Wo16m4qyZzJQKIAb1/o7N8j6I/vFR+LwZ
	z+Scp4TGThVWhJjd5MY/EOeomZSjlqITm7JI2nhDPdE4zoEPf0Ms1eiUYnNS1U2Z+hcF8V
	SZND33S+PAZAlfX5UsdXu/Phox85V0mYe+jntuNOIRYhKyWpS+c0v2/h93yaqDYQQGHz3K
	S94+wYS+3fFGJsrUBE24GP3XUt5OtOX3r0GQtVz0redEXrSqeDC1a4qm4XNrWQ==
Date: Sat, 31 Jan 2026 00:08:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V4 0/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Message-ID: <176981440897.2224815.9970727352509260492.b4-ty@bootlin.com>
References: <20260123063325.8210-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123063325.8210-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_150821_982235_7662681A 
X-CRM114-Status: UNSURE (   8.82  )
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

On Fri, 23 Jan 2026 08:33:22 +0200, Adrian Hunter wrote:
> Please note, all patches now have Frank's Rev'd-by.
> 
> Please can this to be applied for the next release?
> 
> 
> Changes in V4:
> 
> [...]

Applied, thanks!

[1/3] i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
      https://git.kernel.org/i3c/c/c481ef12e713
[2/3] i3c: mipi-i3c-hci: Add optional System Suspend support
      https://git.kernel.org/i3c/c/c3357bdd9be9
[3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
      https://git.kernel.org/i3c/c/4280197d154c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
