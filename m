Return-Path: <SRS0=Ce++=VD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571EFC5B578
	for <linux-i3c@archiver.kernel.org>; Sat,  6 Jul 2019 07:28:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118C021670
	for <linux-i3c@archiver.kernel.org>; Sat,  6 Jul 2019 07:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fXf/3s2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118C021670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=672R8oxov53vLFger7GUlMg43s+d16wtxYvrSIsnsdA=; b=fXf/3s2VL7FwNC
	mWsCkQlVGcU24ktaAN3YYobv0PSrzJMSgcoCijsTc7mb6pFdyf6ErFbeDfWWsdy34K8O7m/St0ru8
	qj7ldQjynP5GTVGToo44WH2ezwExE+dBmZU+qDNxT/aWeszVG0gp7EMtFtD+ZrqOwQsTqBxDFiEll
	ShT1f5vgzm5stpUH+erLNcrme2G4hF3nysRL3FwyGTIy4V6mmmhCNuqLlfqcZ7GEwXgQ8WBf6vPCq
	mdC3pTmQ5ocDR9lr34x/xIXf3rRhsqU7jw1NKSHTafiYBl6DCg8kAO/+CBX5XEQ1DyZhPtRY9Xoq0
	J5zWkGsFVY1tYVoG3osA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjf75-0006e3-F5; Sat, 06 Jul 2019 07:28:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjf72-0006dd-Kb
 for linux-i3c@lists.infradead.org; Sat, 06 Jul 2019 07:28:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE57428A417;
 Sat,  6 Jul 2019 08:27:58 +0100 (BST)
Date: Sat, 6 Jul 2019 09:27:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Changes for 5.3
Message-ID: <20190706092755.1e0e8275@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190706_002800_813203_00D06A3E 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C PR for 5.3.

Regards,

Boris

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.3

for you to fetch changes up to ede2001569c32e5bafd2203c7272bbd3249e942e:

  i3c: master: Use struct_size() helper (2019-07-04 12:05:14 +0200)

----------------------------------------------------------------
* Drop support for 10-bit I2C addresses
* Add support for limited bus mode
* Fix the Cadence DT binding doc
* Use struct_size() to allocate a DEFSLVS packet

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      i3c: master: Use struct_size() helper

Przemyslaw Gaj (2):
      i3c: Drop support for I2C 10 bit addresing
      dt-bindings: i3c: Document dropped support for I2C 10 bit devices

Qii Wang (1):
      dt-bindings: i3c: cdns: Use correct cells for I2C device

Vitor Soares (3):
      i3c: fix i2c and i3c scl rate by bus mode
      i3c: add mixed limited bus mode
      i3c: dw: add limited bus mode support

 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt |  2 +-
 Documentation/devicetree/bindings/i3c/i3c.txt             |  4 +++-
 drivers/i3c/master.c                                      | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/i3c/master/dw-i3c-master.c                        |  7 +------
 drivers/i3c/master/i3c-master-cdns.c                      | 10 +---------
 include/linux/i3c/master.h                                | 10 ++++++----
 6 files changed, 71 insertions(+), 44 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
