Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42F7C10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 05:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD4620684
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 05:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIGraEq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD4620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hz1NmGvs2QsPa2DFivqItFJpY2cLaj+1vGcDPWVJH0=; b=HIGraEq8mAZXGr
	/MaZG7TpOYonvhRstoWKoNUjL6b6PzarTV4A2xWzBrNmYSxgzW9BDoad+Nrj5sqbWHwa+e5ZpqiRa
	lKQzGOZl9zbtMcN1s9cbtK8Qx8d1/ENRZ30fgTJg1+5FwrRbDopOtjHGgyuvxzmnCp6hCTCGM6hQq
	iR9lw9MSo3cYmmeTBoDc1P4YxTpsXnNgKUEnbDqK768hKSvgPS4JaFZOZNB1t9S1WaA4j+rIHTdR0
	ZN1PKJ0xe8soeO8+yqiob7HppGqiNwVJm2Wp4K4wbYSFQlSGQkSVQaZoP+X5vqcDU/hQnLJYgWBWD
	ft9m7N6iNAadSBVlrO8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGGdX-0006JW-BJ; Tue, 16 Apr 2019 05:28:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGGdU-0006Ir-V5
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 05:28:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45B64260C42;
 Tue, 16 Apr 2019 06:27:59 +0100 (BST)
Date: Tue, 16 Apr 2019 07:27:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 0/4] Drop support for I2C 10 bit devices from I3C
 subsystem
Message-ID: <20190416072755.3605997d@collabora.com>
In-Reply-To: <20190416044146.2382-1-pgaj@cadence.com>
References: <20190416044146.2382-1-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_222801_135009_76881081 
X-CRM114-Status: GOOD (  11.75  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 16 Apr 2019 05:41:42 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> I3C MIPI spec does not clearly say that I2C 10bit devices are supported.
> Additionally, it isn't possible to pass 10 bit device properly through DEFSLVS
> command and reserve address for such device on secondary master side.
> 
> Main changes between v3 and v4:
> - Fix changelogs
> - Fix patch versioning
> - Change order of the patches to make it bisectable.
> 
> Przemyslaw Gaj (4):
>   i3c: master: cdns: Drop support for I2C 10 bit addresing in Cadence
>     I3C master
>   i3c: master: dw-i3c-master: Remove i2c_funcs hook implementation
>   i3c: Drop support for I2C 10 bit addresing

Sorry, but this is still breaking bisectability. If you run the kernel
after applying the first 2 patches you get a NULL pointer dereference.
Please merge patches 1 to 3 into a single patch, that's the simplest
solution.

>   dt-bindings: i3c: Document dropped support for I2C 10 bit devices
> 
>  Documentation/devicetree/bindings/i3c/i3c.txt |  4 +++-
>  drivers/i3c/master.c                          | 21 ++++++++++++++-------
>  drivers/i3c/master/dw-i3c-master.c            |  6 ------
>  drivers/i3c/master/i3c-master-cdns.c          | 10 +---------
>  include/linux/i3c/master.h                    |  5 +----
>  5 files changed, 19 insertions(+), 27 deletions(-)
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
