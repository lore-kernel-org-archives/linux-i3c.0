Return-Path: <SRS0=8Cox=KC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A53C433ED
	for <linux-i3c@archiver.kernel.org>; Fri,  7 May 2021 19:30:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 326D46141D
	for <linux-i3c@archiver.kernel.org>; Fri,  7 May 2021 19:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 326D46141D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXuLR8rKsxaOUOL1skw8jVm9hOIWhq5Ns+5DcuU7Ric=; b=nUZJCKsdOcMGMNBhdLaEQcr95u
	51RLwhrxEhnF1pjdYCMmbxtPhWnparmYTtuyL6TK7k1YzmQUOt7YfX0nxNcV7TbavgGNpQinQG0L4
	4vtVPC7HtqarI/M9GRLM0q+6xsChCklicF1zdzNvFtY7EN0ydM9x41VB9cthr7digmAT073yENMYv
	9qE7B+/3eosbq+1hesnHm8VIQlTIAjc7wMJTkogVEOtBJVdPTMr7etao6dpJc8GVBk/bY0jPxn837
	sWjQB+p7LmA3ZoLEGeaMSafNt6KebyBI78mUoRVmcy1N56a8tL5yeqorArPr800WMk/gE/LLt6xXb
	YF7GPkiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf6BB-007rmL-Hu; Fri, 07 May 2021 19:30:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf6B7-007rlf-HH
 for linux-i3c@desiato.infradead.org; Fri, 07 May 2021 19:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NbemFW6MmyhOo7faQCyKCWnRllJ4uKLXrk2WtIHzANg=; b=pnHOfSEmWmuNwoGfHCv6jTcfW4
 QVbE/fH0wglwl1e7CbJQ4vH0PCw4e3bQ1tnNxuNk2z84w4q4wdKg4LMf2CUHG1UCVVV1eWN7VCOxr
 d2245YPPcKnF7xOWrfjQlLZH4w0Ej8cwe6OEJ5U7lfDs3QLTvAkG1U+UdMyVrt96csXQVcYvn0zVb
 P1bF2TXoxhDDD0V9YV1klQmjAh90oR+K/vcf8ndmG3YuVQhFYaD404yCFlt6lr56uBbuP4rNVchYU
 NORAltLshHdoL/LlKUCyXBn4q+AXuCPcT/g6jMGxewMExOHyA2+nEV2BU9NgdVpzA4ypO9UZwVZqV
 6RZAPCrQ==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf6B4-0078iw-3b
 for linux-i3c@lists.infradead.org; Fri, 07 May 2021 19:30:24 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C485C20003;
 Fri,  7 May 2021 19:30:15 +0000 (UTC)
Date: Fri, 7 May 2021 21:30:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 5.13
Message-ID: <YJWVRyqnPVlz5vY5@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_123022_307621_7010195C 
X-CRM114-Status: UNSURE (   7.55  )
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

Hello Linus,

Here is the I3C pull request for 5.13. Only three fixes this cycle.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.13

for you to fetch changes up to 0d95f41ebde40d552bb4fea64b1d618607915fd6:

  Revert "i3c master: fix missing destroy_workqueue() on error in i3c_master_register" (2021-04-24 22:21:01 +0200)

----------------------------------------------------------------
I3C for 5.13

Subsystem:
 - Fix i3c_master_register error path.

----------------------------------------------------------------
Colin Ian King (1):
      i3c: master: svc: remove redundant assignment to cmd->read_len

Jae Hyun Yoo (1):
      Revert "i3c master: fix missing destroy_workqueue() on error in i3c_master_register"

Rob Herring (1):
      dt-bindings: i3c: Fix silvaco,i3c-master-v1 compatible string

 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 drivers/i3c/master.c                                          | 5 +----
 drivers/i3c/master/svc-i3c-master.c                           | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
