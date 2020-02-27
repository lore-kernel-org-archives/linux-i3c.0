Return-Path: <SRS0=/dce=4P=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB48C4BA3B
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56CA24696
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBQPsJdv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q9e79+Lk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56CA24696
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=H2Lc/isIbaij03K04eb7/XYTG6q/LlAEM+K7kM/fRdw=; b=JBQ
	PsJdvL2lX6LWJr0kTzjJ2wMh7gMKl8PkNGFy6y7UkLxXaoe5wsZSQK9dIjn7/KxCzvrQPIGVhb4Gw
	ID+57Ay9Pgcbze1o7vsQFYpk2ixy6svMtTXmZFMtg7JpaNe5yioyLiPy0EOFi3qPg3A+rQ8faKvLL
	FtZmMxqEI20j8XmG9ox7YXeNyyxKxy2w/zJdV7NnC9PYGGEpb8vf5Khyl7llMpnpBSKl5gCD+OFva
	89HMii51SyClGpkEagqXnNpFHznHBJON9cVnZznzqwkIccW9k83gKqxSgXRHnLiX8fbwHeSlkSU/1
	IxIDMUDF9yyQypZXoxpkvr1xc0RbHMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7HOE-00066d-Gr; Thu, 27 Feb 2020 11:31:38 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7HO9-00063T-4F
 for linux-i3c@lists.infradead.org; Thu, 27 Feb 2020 11:31:36 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D704943B60;
 Thu, 27 Feb 2020 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582803093; bh=wDA1AiJunhzsZFcDF4j0BmRmmFKn+Y6/dgk0kHTzJ3E=;
 h=From:To:Cc:Subject:Date:From;
 b=Q9e79+LknaGdmsD1gSD1A+ltfxvaEB4O6XkHM0WV162HxZW/Lx838ViDjm19puHFg
 TBsyaYv7Z99HKIwl7hegGdKeiSxm01Z3zVUXQcLWKSrDsr+oTY2HgqtIi7/AAa2Kou
 RseZKjnzQ2Uo2LRbk1lBqFuQZwqZwtv9YgEJKTyefENP/+Y54CKXn2jzY+o9C5DhVv
 XJc+gjGGSxJtOUrDlVTGlrnzX96vg+3nrzy7b/8NSAIPZyurPNn49XtARL1QbGLYfs
 wOoNOWPEGtV0jiAaRxzdGhAp4bry7qv4J/kHCmeUvfC38rBmeo+RqC4F76LdpmyDAO
 cF08/veeSda8Q==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 77E19A005D;
 Thu, 27 Feb 2020 11:31:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 471693E9DF;
 Thu, 27 Feb 2020 12:31:26 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: pgaj@cadence.com,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 0/4] i3c: Address i3c_device_id related issues
Date: Thu, 27 Feb 2020 12:31:05 +0100
Message-Id: <cover.1582796652.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_033133_483300_FF9E7AC4 
X-CRM114-Status: UNSURE (   6.63  )
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
Cc: linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello,

When the I3C subsystem was introduced part of the modalias generation
logic was missing (modalias generation based on i3c_device_id tables).
This patch series addresses that limitation and simplifies our match
function along the way.

Changes in v2:
  Add modalias sysfs attribute
  Fix i3c_entry fields

Boris Brezillon (4):
  i3c: Fix MODALIAS uevents
  i3c: Add modalias sysfs attribute
  i3c: Generate aliases for i3c modules
  i3c: Simplify i3c_device_match_id()

 drivers/i3c/device.c              | 50 +++++++++++++++++----------------------
 drivers/i3c/master.c              | 24 ++++++++++++++++++-
 scripts/mod/devicetable-offsets.c |  7 ++++++
 scripts/mod/file2alias.c          | 19 +++++++++++++++
 4 files changed, 71 insertions(+), 29 deletions(-)

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
