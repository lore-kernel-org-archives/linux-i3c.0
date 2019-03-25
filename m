Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2ABC43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02D22184C
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ljX2zkSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02D22184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IdHI9x5TbG7bZ+R+03H7EaC64v25hdF3n72mDxEFSRk=; b=ljX2zkSIGXNiGUGXDWjDyNUyMh
	3Y6imcjXF6p2IeVpa8uzeMpcMwCZlKZHrLxNXhXbLK5epS52Dn0FxuRO+dE5hq75vDGRzPMTy5k60
	3RIWMomSqEmD2kA2MTzVXQ1NuqG65zhRz/XbNQubVpq//en7l8m0ERZVYafC83z19zb8YaR8mBPXd
	onvmANUDf7n47i/Y9M2cmjyrzoAwKp0jui+Q+z4XLCpeb+dFsratD3fUKGaEhJMU31y5Vjq2wNMpT
	4yvWZFdeKcujB4l0gXIMMhm7nbZhrGYeqd1YcWBp3LyodUfIAWFQRqQayO4zpKylS06XtnrM65CTA
	Iz4ZbaiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA8jN-0001lT-F1; Sat, 30 Mar 2019 07:48:45 +0000
Received: from smtprelay0009.hostedemail.com ([216.40.44.9]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8X5x-0001hz-JY
 for linux-i3c@lists.infradead.org; Mon, 25 Mar 2019 21:25:28 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id E776B181D341F;
 Mon, 25 Mar 2019 21:25:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: pot74_119995f518f3e
X-Filterd-Recvd-Size: 2735
Received: from joe-laptop.perches.com (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Mon, 25 Mar 2019 21:25:20 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Subject: Bad file pattern in MAINTAINERS section 'I3C SUBSYSTEM'
Date: Mon, 25 Mar 2019 14:25:19 -0700
Message-Id: <20190325212519.26558-1-joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_142525_850070_D93F1E0B 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 30 Mar 2019 00:48:44 -0700
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
 linux-i3c@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

A file pattern line in this section of the MAINTAINERS file in linux-next
does not have a match in the linux source files.

This could occur because a matching filename was never added, was deleted
or renamed in some other commit.

The commits that added and if found renamed or removed the file pattern
are shown below.

Please fix this defect appropriately.

1: ---------------------------------------------------------------------------

linux-next MAINTAINERS section:

	7333	I3C SUBSYSTEM
	7334	M:	Boris Brezillon <bbrezillon@kernel.org>
	7335	L:	linux-i3c@lists.infradead.org
	7336	C:	irc://chat.freenode.net/linux-i3c
	7337	T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
	7338	S:	Maintained
	7339	F:	Documentation/ABI/testing/sysfs-bus-i3c
	7340	F:	Documentation/devicetree/bindings/i3c/
	7341	F:	Documentation/driver-api/i3c
	7342	F:	drivers/i3c/
	7343	F:	include/linux/i3c/
-->	7344	F:	include/dt-bindings/i3c/

2: ---------------------------------------------------------------------------

The most recent commit that added or modified file pattern 'include/dt-bindings/i3c/':

commit 4f26d06669619b960aa7246378dcdf1690c97384
Author: Boris Brezillon <boris.brezillon@bootlin.com>
Date:   Fri Mar 23 11:38:16 2018 +0100

    MAINTAINERS: Add myself as the I3C subsystem maintainer
    
    Create an entry for the I3C subsystem and mark it as maintained by me.
    There's no official git repository, patchwork instance, mailing list or
    website yet, but this will be added after the subsystem has been
    accepted.
    
    Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
    Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

3: ---------------------------------------------------------------------------

No commit with file pattern 'include/dt-bindings/i3c/' was found

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
