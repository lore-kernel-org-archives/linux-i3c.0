Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF558C25B78
	for <linux-i3c@archiver.kernel.org>; Sat, 25 May 2024 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92FGVm45fcHBfcVGCKDBQIDHRRfU2okmKvOM5lcdPmM=; b=I+3spsuew1Wb5q
	h4yzswIVyTlTgyMfWfj3JSHqTHSON/z0fg11sjWtVZC0pxjtHuwTgNtoCQFNVAPcMRDK5FMIBlG/T
	O217B8ZsrUk0vMqmq1PnOWmjh6QcP8Qidjd55/LWC/a8uYKWYOUYFMP5hhFzuaD7XAFtiobnXUwHm
	74pz86W52DLXth/hqZMLE6JGrY8pMauTqO9+QxzjM8dGdZ6NYCIb4TnUo8Hy/hXRR26kiclz1cXX0
	MoBdqGunikDf7xgaXa7vHeqjFz50iIsalsIhbsze8Bca2vW+NVzmrYvVGPXqilri9FOWoTDyHd6W1
	7NURQ9SKXlTkY9RChANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAmCa-0000000Aa1f-31kH;
	Sat, 25 May 2024 07:52:28 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAmCX-0000000Aa0C-0oEa
	for linux-i3c@lists.infradead.org;
	Sat, 25 May 2024 07:52:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D24C240005;
	Sat, 25 May 2024 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716623538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hvYNI3hFtOWF93OT5lxSxIBWa6XcTcllEzru2wGd970=;
	b=I8l3VtoPj9ZtgN8UEtVxy1qJwEB7bIeRB418wizQS5AWI5SgCmTxUYtzVu9BuvOAEaOJxj
	oku/L1Y+pHzQgWxRgEffFFy6KuJ63AQxMhYDyOt3/C4MOyVzp4bx8xHbs4qCoxpvo2r9qW
	0kLPVgA/t8X5HL0Ua1qoY3ddd7M1vPmCyRiSFNcATJZvOnXWNn6xeXTWxBWrwU9tf1GfVH
	pn5bbpcMUqJYbBwXwjujMVzH974w7HfEn+UDSoOsRa8JQYgrm37y5jjKtg53jhcD1Vn2VN
	77gWLie5DidppbVv/6x7DXJqRzjaM1P7AyrFm7AkoWPd+nykZkVPq48bwU/OPw==
Date: Sat, 25 May 2024 09:52:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.10
Message-ID: <20240525075217d90cc066@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_005225_559059_0DB725DF 
X-CRM114-Status: UNSURE (   8.50  )
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

iHello Linus,

Here is the i3c subsytem pull request for 6.10. Runtime PM (power
management) is improved and hot-join support has been added to the dw
controller driver.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.10

for you to fetch changes up to 1d08326020fba690cbb7b8f1b38ab4eab6745969:

  i3c: dw: Add hot-join support. (2024-05-23 00:29:19 +0200)

----------------------------------------------------------------
I3C for 6.10

Core:
 - Allow device driver to trigger controller runtime PM

Drivers:
 - dw: hot-join support
 - svc: better IBI handling

----------------------------------------------------------------
Billy Tsai (1):
      i3c: dw: Add hot-join support.

Frank Li (3):
      i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()
      i3c: master: svc: change ENXIO to EAGAIN when IBI occurs during start frame
      i3c: master: svc: fix invalidate IBI type and miss call client IBI handler

Mukesh Kumar Savaliya (1):
      i3c: master: Enable runtime PM for master controller

 drivers/i3c/device.c                |  4 +++
 drivers/i3c/master.c                |  6 ++++
 drivers/i3c/master/dw-i3c-master.c  | 65 ++++++++++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h  |  2 ++
 drivers/i3c/master/svc-i3c-master.c | 18 +++++++---
 5 files changed, 79 insertions(+), 16 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
