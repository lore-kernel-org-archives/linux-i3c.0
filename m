Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF89C48BEB
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6025523403
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kUMEjNP6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZCpfD6NX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6025523403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qfVPG/u9q75SNi6urTUWwICsaEVvDwBhXzHqREX4U8M=; b=kUM
	EjNP6nF9QnWNDhZkir1SokgYDhuRg4DV0XMMl2Ta5dHjvGSYFvBeU7IObD9ReTU62EQbb9Jga9t1l
	cujihOQImrIlcRYFl0E4SVq3yCt08EjXFCry6KsxSqtFYfbdvioAuuNHfhnrfbkv2BEKP7by0hPvh
	4C6r8MtmiicPySDHNgIK3lgaGI3uFzU7hTFnEcMxFMAowi6qApF69hKkUwod0I0UtuNH1W0vrIQD1
	w+wC0j0UxUeQNI4KUdrUTY3bj11/knNBrNWdYesihVMYTh0027vh9xGDqAc4pfSncXAnubUWunm/+
	//5YTJAXUZRGZfEHZTTaY9D/4XW59cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3HXK-0006ci-Fk; Thu, 29 Aug 2019 10:20:14 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3HWq-00054c-7a
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 10:19:46 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20432C0391;
 Thu, 29 Aug 2019 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567073980; bh=od80gmY2zZhh+3Bcew23DiiwRVI+IoD71SEOvgTHG9g=;
 h=From:To:Cc:Subject:Date:From;
 b=ZCpfD6NXKGjUIDyuyy6P1W/RWFyrnEbssFCR4FlNciPZnoNwnK4hSjHHsciqeGWvj
 csro7zd7SZAZh0DCnfIBbf3NUL3+o0LR8nfrt/WweoO5Mr2s7sYVuQ3Kr9kqlSHbue
 SSm8KGVcVawD/Fx3v5AmvjqXgCkwu2ObxiOm0Z1c8vAeEpTEvOAPtXDfI0SrjNhapt
 xgppE8g+DyxZToCwFV+TDQTHULhTyRGl6/qae1RQxj7g8cMi7/N02EhunlgLKMl+Oz
 kswwWiVz9H0z4sIjPUfWp+xwNF1Z3Hh9YmZTX8ZQX9pt5kKnPrK0cnOBRBS3sXVfMe
 uXKrEtyBe4lng==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 37493A005F;
 Thu, 29 Aug 2019 10:19:38 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 1176B3B640;
 Thu, 29 Aug 2019 12:19:38 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH 0/4] i3c: remove device if failed on pre_assign_dyn_addr()
Date: Thu, 29 Aug 2019 12:19:31 +0200
Message-Id: <cover.1567071213.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_031944_448954_FDF1530F 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, robh+dt@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, bbrezillon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series remove the devices that fail during
pre_assign_dyn_addr() and were being sent on DEFSVLS command.
With the change above, during the i3c_master_add_i3c_dev_locked() is
necessary to check if the device has i3c_boardinfo and try to assign the
i3c_dev_boardinfo->init_dyn_addr if there no oldev. This change will
allow to describe in DT device with preferable dynamic address but without
static address.

Vitor Soares (4):
  "i3c: detach and free device if pre_assign_dyn_addr fails "
  i3c: check i3c_boardinfo during i3c_master_add_i3c_dev_locked
  update i3c bingins
  i3c: master: dw: Reattach device on first empty location of DAT

 Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++---
 drivers/i3c/master.c                          | 33 ++++++++++++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            | 16 +++++++++++++
 3 files changed, 56 insertions(+), 6 deletions(-)

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
