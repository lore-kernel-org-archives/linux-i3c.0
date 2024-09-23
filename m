Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC09CF9C71
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Sep 2024 22:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDGAQlHipoccGmzOK1n+1JMCsF3ROiJXHW+QE782EAo=; b=aAHYMIEnjjPaEB
	5t+UPJDrg0kKkIb54YBbhXAIZFPAm8nCI9ymoaCF3fECuqV4BUg4G81nIX8DYPCK9khvFbWKzRK7/
	JmSV0ctT8zgKCOU0Eht7UK1aakqXhakBI1/3rGxcUkgB+PqSnFiXIOWYKUwmT+BT+5CLgrN9V8sVg
	N0Kj5uK6q8Gc0nCV1kpUtSnQzPXVfixtreAK7EMFhFEFlzCwcgw98/N3L+XQ6JtoA0q9ZBa96LvC9
	/JIXr1bzZSIyvAA7Ck2qSh69K40rfcJ9eM+v/nxXNlnfOdQaQHwRbN7abZm1hrZI538QydZwXg1cL
	Vjz/mbBLpDsjFWV2UUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssrXz-00000000bO6-20Mn;
	Mon, 23 Sep 2024 22:28:47 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssrXv-00000000bNf-436d
	for linux-i3c@lists.infradead.org;
	Mon, 23 Sep 2024 22:28:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E0EC1BF203;
	Mon, 23 Sep 2024 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727130519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=6q4OUpNqHNINd6dQdsFhTzKMc3jCJy4Zxod9kfNrUZo=;
	b=YWtiRgdMfsWrdPVgh+EIrjP+8VBfXzOiaWvfvn9jjh2sjgkWb26SPACYDPoAkO9zDdda8z
	0mXepZNT3Q00jQa5KcOyXchPM/8so4FxvT9xSo2p7Sf1C+Uwf3FbhuK/L+nxkPXNw8bxW4
	9Xa5RR65ZFXBQdrQJyyRa7BSEd0wiVV3cRxQpXtLnc49IwvdA21+/6dPxldTPi/gYf4QsI
	H5Q4QEsK8o5UxubFonaYoJ2Og8n61kml1vBU0aqe0frT8cbmF81yDtKe6YCiAkD9HTw258
	dg0Y/jw+YIxWZH7vF8xTCp6rY5EUSOthjgRuR8ASCJtqsUn8GigjXAPCAjwxzA==
Date: Tue, 24 Sep 2024 00:28:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.12
Message-ID: <20240923222839975a95a9@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_152844_670639_3F5C7D39 
X-CRM114-Status: UNSURE (   9.88  )
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

Here is the i3c subsystem pull request for 6.12. We get support for the
I3C HCI controller of the AMD SoC which as expected requires quirks. We
also have fixes for the other drivers, including rate selection fixes
for svc.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.12

for you to fetch changes up to 61850725779709369c7e907ae8c7c75dc7cec4f3:

  i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition (2024-09-17 16:51:45 +0200)

----------------------------------------------------------------
I3C for 6.12

Core:
 - allow adjusting first broadcast address speed

Drivers:
 - cdns: few fixes
 - mipi-i3c-hci: Add AMD SoC I3C controller support and quirks, fix get_i3c_mode
 - svc: adjust rates, fix race condition

----------------------------------------------------------------
Billy Tsai (1):
      i3c/master: cmd_v1: Fix the rule for getting i3c mode

Carlos Song (3):
      i3c: master: support to adjust first broadcast address speed
      i3c: master: svc: use slow speed for first broadcast address
      i3c: master: svc: adjust SDR according to i3c spec

Kaixin Wang (2):
      i3c: master: cdns: Fix use after free vulnerability in cdns_i3c_master Driver Due to Race Condition
      i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition

Liao Chen (1):
      i3c: master: cdns: fix module autoloading

Shyam Sundar S K (6):
      i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C Support List
      i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only after i3c hci v1.1
      i3c: mipi-i3c-hci: Add a quirk to set PIO mode
      i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
      i3c: mipi-i3c-hci: Add a quirk to set timing parameters
      i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold

 drivers/i3c/master.c                         | 12 ++++
 drivers/i3c/master/i3c-master-cdns.c         |  2 +
 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c     | 12 ++--
 drivers/i3c/master/mipi-i3c-hci/core.c       | 36 +++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 10 ++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 44 +++++++++++++++
 drivers/i3c/master/svc-i3c-master.c          | 84 +++++++++++++++++++++++++---
 include/linux/i3c/master.h                   | 16 ++++++
 9 files changed, 193 insertions(+), 26 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
