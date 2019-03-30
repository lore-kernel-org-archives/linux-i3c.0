Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731B1C43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4CB2184C
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBSkXLzO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4CB2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAyR1EX4oMRBUCNPDBUHG/JD/E1ryNiDlU4XYAkWqvA=; b=SBSkXLzOv2Qej1
	6HDujfAFM14IGPOG+eXOFZaL0cBIH9pe31LTDg0d4sSPpzSkbosV3sv0VaCk6L7jsrlK587CttnhD
	S4rUrlfk8OZxd3WxenrI+OE+hK3jtWnFDBNCI96bDhEZKgiNpky3R5ozIxzo7qGHVRzbBKBOzAg98
	30GqC2ZBuI8nVcSXCl2HP8qiQaZFRYukji/v8uCn7Arbt0XnioxheOxki3bmj8hLruP3gSl5pLb4Z
	ZNGlolbsKcwVtQcsNsIA0+csEWIREEuhjBTXiunp8VInNDGgOOFM8lA+iWmykG481e7SeOPggb3gS
	aB0sl09Ush+wX7HTUFTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA8lx-00031x-OM; Sat, 30 Mar 2019 07:51:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA8lu-00031G-KJ
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 07:51:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0AD90274F9B;
 Sat, 30 Mar 2019 07:51:15 +0000 (GMT)
Date: Sat, 30 Mar 2019 08:51:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joe Perches <joe@perches.com>
Subject: Re: Bad file pattern in MAINTAINERS section 'I3C SUBSYSTEM'
Message-ID: <20190330085111.71a04fd9@collabora.com>
In-Reply-To: <20190325212519.26558-1-joe@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190325212519.26558-1-joe@perches.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_005122_793672_E80CF79A 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-i3c@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Joe,

On Mon, 25 Mar 2019 14:25:19 -0700
Joe Perches <joe@perches.com> wrote:

> A file pattern line in this section of the MAINTAINERS file in linux-next
> does not have a match in the linux source files.
> 
> This could occur because a matching filename was never added, was deleted
> or renamed in some other commit.

This is a leftover of previous versions of the patch series where
things were added to include/dt-bindings/i3c/.

> 
> The commits that added and if found renamed or removed the file pattern
> are shown below.
> 
> Please fix this defect appropriately.

I'll fix that. Thanks for reporting the problem.

Boris

> 
> 1: ---------------------------------------------------------------------------
> 
> linux-next MAINTAINERS section:
> 
> 	7333	I3C SUBSYSTEM
> 	7334	M:	Boris Brezillon <bbrezillon@kernel.org>
> 	7335	L:	linux-i3c@lists.infradead.org
> 	7336	C:	irc://chat.freenode.net/linux-i3c
> 	7337	T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
> 	7338	S:	Maintained
> 	7339	F:	Documentation/ABI/testing/sysfs-bus-i3c
> 	7340	F:	Documentation/devicetree/bindings/i3c/
> 	7341	F:	Documentation/driver-api/i3c
> 	7342	F:	drivers/i3c/
> 	7343	F:	include/linux/i3c/
> -->	7344	F:	include/dt-bindings/i3c/  
> 
> 2: ---------------------------------------------------------------------------
> 
> The most recent commit that added or modified file pattern 'include/dt-bindings/i3c/':
> 
> commit 4f26d06669619b960aa7246378dcdf1690c97384
> Author: Boris Brezillon <boris.brezillon@bootlin.com>
> Date:   Fri Mar 23 11:38:16 2018 +0100
> 
>     MAINTAINERS: Add myself as the I3C subsystem maintainer
>     
>     Create an entry for the I3C subsystem and mark it as maintained by me.
>     There's no official git repository, patchwork instance, mailing list or
>     website yet, but this will be added after the subsystem has been
>     accepted.
>     
>     Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>     Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> 3: ---------------------------------------------------------------------------
> 
> No commit with file pattern 'include/dt-bindings/i3c/' was found
> 
> _______________________________________________
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
