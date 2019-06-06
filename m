Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E915C28EB6
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE66207E0
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+z95V0S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kpjJCBsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE66207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Pa2uYYOxi34Km8bClUrm4icO9Z5b+pjRXpI4xAuOIpg=; b=S+z
	95V0S3xlTrp04kg5baDwSSgxR0wryMcrVOReRy6k7slIAnrPb9TILm9KBb8OcPmePwCjfoW6ucw3V
	Um4ker8UcplvjMYRlM19pT3P13YqVI7eFbJW2uJUF3rkqeL/4qWOXD1l9wxEsznSR5wZm4i9UnsxI
	/bE3HwnQim2La4QsdBDI47FXPHqH8p2GjpyL/ed+/3GKgSFTxLxhhDJOyKygM6pscGxwmlFDYMEFd
	odM75JGsTG/FdOGDslJYq39zBXw/jsFS4MveNP50YFqMRih5YdYHAa2dhZEOIDTRkmLMo0KqPBFPw
	iDl8loQfdePZvkkWjjqn+wXnBtomgww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYswC-0004b6-GD; Thu, 06 Jun 2019 14:00:16 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYswA-0004U5-1m
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 14:00:15 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1916FC0B4B
 for <linux-i3c@lists.infradead.org>; Thu,  6 Jun 2019 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559829619; bh=llL9weTnFhAXpoLAP7tKlRaiIgSzIDQ4VfIXTT9nIjI=;
 h=From:To:Cc:Subject:Date:From;
 b=kpjJCBsxEWy0KrggoqrUNQzlZxnUoAmhTH8kcBbFT3Njfw+AE0jdA3Rar1tT86mr8
 ugRIUCMzeo1kmI7uBVb0LzDAOcFw/IsxNhGP1uvgpi2G97/nHRFh1TagUw/HrBthQm
 f6fqURyOtEK882RhU/oX46k7JXTVRz/gAluqLeh5AHqiHiT/VrY1RXGssESH42vHYv
 HUN6gLS3XVE22XMJZz56LsUNsXRgcX9TGIPf1uWLtOVGMghEgUu0GI1+ISh2FJO1Lb
 VYYIrn+f30DMzfaI5JuOk8Se/vSoxHpBkgwAWNxQ1D+Gg4mqMD6zaGks8Ep4c8gp0X
 7QKO9HjFkyRxA==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id D56F4A0057
 for <linux-i3c@lists.infradead.org>; Thu,  6 Jun 2019 14:00:06 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id A3ED73F6CB;
 Thu,  6 Jun 2019 16:00:06 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2 0/3] Fix i2c and i3c scl rate according bus mode
Date: Thu,  6 Jun 2019 16:00:00 +0200
Message-Id: <cover.1559821227.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_070014_090520_07C5EAF5 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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
Cc: Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series fix the i2c and i3c scl rate according the bus mode
and LVR register. It also introduce the mixed limited bus for the
cases where i2c devices doesn't have 50 ns filter but allow higher
clock rate for i3c transfers.
Please refer table 5 and 10 of i3c bus spec v1.0 for more detail.

Please follow each patch commit message for more details and changes
made in this version.

Vitor Soares (3):
  i3c: fix i2c and i3c scl rate by bus mode
  i3c: add mixed limited bus mode
  i3c: dw: add limited bus mode support

 drivers/i3c/master.c               | 66 ++++++++++++++++++++++++++++++--------
 drivers/i3c/master/dw-i3c-master.c |  1 +
 include/linux/i3c/master.h         |  5 +++
 3 files changed, 59 insertions(+), 13 deletions(-)

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
