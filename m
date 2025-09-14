Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED17CAC587
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChreKDYIMSwizWC6ogPPV6vhxczMkJVkWll2PqbeiEE=; b=ZEJOJpx4ZJ0ZnK
	xfrC6xc0lhgGYKoHZuW04l7VFkJWbacASLDAhH5t0opI3l4OGkoHMhTeb75vMK6EaqZs58ExeRYAb
	HigTyaUBc02pH/eBreREkNHD7ae9SkFdrNnqjKZ7mBgtNUYqJ3v8pIoYqK+aRDvB++ovuu4g/CKyH
	MHQhGs37fnqv7S8zeodJ0jSdzNxikGC/Id+zi88lDDDdADdEvLrJ0hShgwQ7Cbo7pOFqCyRxEqf7T
	pickRMvlYczxW/M1ur6AhAizb5XrZ62AaMjvaA8DBA8cx9/CjoalzPjSFg5/t+cJ+AS/Ohx51rhFT
	qLKMzUq390f+Jm7kGBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNV-000000029Uf-1ODV;
	Sun, 14 Sep 2025 20:31:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNQ-000000029U6-2jc4
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:31:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B5304E40BA2
	for <linux-i3c@lists.infradead.org>; Sun, 14 Sep 2025 20:31:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BD496063F;
	Sun, 14 Sep 2025 20:31:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 159EE102F29EC;
	Sun, 14 Sep 2025 22:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757881870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PpMJF8cqf1x96f188oC5hOOcRDQGqkpvemFjNhrSDG4=;
	b=jtnUVfOX/TnZLT4aJN/Ww9sjI8KNPIMKC0UgI2iH44MNrG3s1O5KIirZbyBlpX84Nd1czQ
	1Xq3iJOh12KlRvlLGZ2VSbcmBpINagSuDXbTBkicjun7ImIbP8HAOR2qxTKOkhFTqwR/io
	MkPd/YBGrxomWUKIZV5EgAB5LOTME0hqlYq4YeF62yQBj2ErdRlI2o4jT86NxT97l4eVU5
	lxsHIxlHWcXq/sZiwL3l1Uf4MD6OS31BRVxa+FBfqnuVhXQa1sWEaPSeuVvu5tBP3wZMhr
	3qdGP3bRd8dppczzvmudQstMVtS4cxeIR0rEopnxGRQ3VYkgfHl7e+HcWd98RA==
Date: Sun, 14 Sep 2025 22:31:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat
 Lake-U I3C
Message-ID: <175788160627.376561.1410247782912337888.b4-ty@bootlin.com>
References: <20250808131732.1213227-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808131732.1213227-1-jarkko.nikula@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_133113_167119_D583F634 
X-CRM114-Status: UNSURE (   4.42  )
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

On Fri, 08 Aug 2025 16:17:32 +0300, Jarkko Nikula wrote:
> Add I3C controller PCI IDs on Intel Wildcat Lake-U.
> 
> 

Applied, thanks!

[1/1] i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat Lake-U I3C
      https://git.kernel.org/i3c/c/8bd93874ea29

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
