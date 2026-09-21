Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314A6C982E6
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RGPvPmlwboqO2AZ4LnFFVLSGWX+BVxatpVS7ZROUXgY=; b=Uue
	M49U69vElaZg9BTV3JviD/QTHpC1subaQSsMMntILV5U2Gb5lHDOKCPZR3w95/FfmbBHJfe+mv8qD
	ppNOqcqwav4empGY5zImZo8yhEUNmbdCqLBdpgAzjwyT4sftsG6nVcm67lk3enm56fuGRjX5FPUlK
	7pxxUQzIVpQGD4TXrUkt3d4FsJhx/3iaT6aI63d63kL4rdB5O/13lnQ5JRcPdQ+EBuV8a2pwWtf6f
	00Aixicq5BjU3jf+JpxVIX32cynd/NQZl+Pcc0G1IplVMnOa+nD4HsjfWie3Zo8es3qNMsfsPf2KQ
	r6e1LmKjwCjgKealPeCWOkIBaV6K/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6N-00000003dSs-3aW1;
	Mon, 21 Sep 2026 23:07:11 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6K-00000003dSJ-444H
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:07:10 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6311475a91.2
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 16:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032027; x=1790636827; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uQiQwfP+TVPEJ4NOA/kG2fqYUhDVbqR/UiJjrphkT8=;
        b=t5pGpcg/76VMbaGSMSSNGqNm6sMstweSkzxfn3gVPw6GoAJr5QgVEU43wMoh7m8/qP
         /CLsO1IFeENmOAKeSOiAsUzuq/rqn4p6GEHywoXtEECBlfZcYuTs66rm94rYbZeNjexm
         DY7iOJ0xxP0joTa7P5zE+5ziBe1uha8vr+x+TUWMRGiTxfryK8iObLYa4FB99QPciZJP
         7JNZKm04U6jM+vSlb1HZF/5wZHjwQRlzvPUR6yS2FrJH7qgx2GT8ZDGiv/7jLxYQh7o/
         L4jjZ79AMxp79QYlmilpg4WpfxlDsH1dI1ZHwuVWqTqfMl6x0iyepnkEvKYPwp+UmTYu
         /hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032027; x=1790636827;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uQiQwfP+TVPEJ4NOA/kG2fqYUhDVbqR/UiJjrphkT8=;
        b=FvxWbQTEqgPTMlFZXHuxxwfoijv/EOIc9P9LWJjvefSwOXxIgtbZrNAnPHwgtYJYg5
         vxwHmwe+UwaleKKseKsRq1+ceHTB/55NAAI62ojx/l9MrxPy16/lmB+dZRJ9DTxoywgR
         0GfWNaPwP9pgNqx78sbZuvG+/NnvQQnKOsxotkLThorbUuWHgRZxWxcebucHQVyaCVfX
         04N2A2EUVnYaySOQGXyE9jquS+3KsC9jCOGwBNn8P7fmn1f5vlojQH0HS4SaVv/ZAOBP
         NsffFJULGb7BmH7Tg5x1gPZ6uT7zIBi1qiQT98iL4ey8Jwqp4Z/ZWxrU7OAga+RQCfar
         PDAw==
X-Gm-Message-State: AFuF++kHYo1onySk/ormvAbTaTVIBse2EHycDMpXPQDROdVIxx3ciHRH
	qIfcPdR4su4R56TfObsAnbojgb9fuCouXOQglEUkFYqSdBheoeB6uJ+BgnTTn8oQiUAkees4Bfr
	3eoremFYpo5wQvaxtwR1KOiv/29G5vchjxU+dZ1aPJPopN+d/Df142Zk0RwjyJLSCAQ3ETEBu/Z
	E8UtJnIWQ21fbQWf22uP6WDHfNvjlYOsoC1cdCYzQElCObsN8mebSGPJs+S9suMItLt7lOLq6Jz
	6TJkA==
X-Received: from dybta14.prod.google.com ([2002:a05:7301:6f0e:b0:313:b34f:8861])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2743:b0:39e:6c69:34de with SMTP id 98e67ed59e1d1-3a06b0ccf6fmr449314a91.66.1790032027092;
 Mon, 21 Sep 2026 16:07:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:05:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-1-samagazaryan@google.com>
Subject: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_160709_028889_5FBADD75 
X-CRM114-Status: GOOD (  14.61  )
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

This patch series introduces the i3cdev module, exposing unbound I3C
target devices to userspace via character device nodes (/dev/bus/i3c/*),
along with the i3ctransfer userspace utility in tools/i3c/.

Userspace access to I3C targets is needed for devices that do not have a
kernel driver bound to them, such as targets in ROM/bootloader recovery
mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
Trust recovery flows), as well as hardware bring-up and diagnostics.

When a kernel driver later binds to an I3C device (for example via
dynamic module loading), i3cdev automatically detaches via the
BUS_NOTIFY_BIND_DRIVER notifier so kernel drivers always take
precedence.

Testing status:
This v5 series has been compile-tested across all modified I3C controller
drivers with W=1. Posting v5 now so collaborators and controller owners
can test the unified UAPI and actual_len updates on their respective
hardware and provide Tested-by tags while we complete final hardware
verification of the v5 updates on our platform.

Changes in v5:
- Updated Patch 2/5 ("i3c: master: add i3c_for_each_dev helper"):
  - Dropped mutex_lock(&i3c_core_lock) around bus_for_each_dev() to avoid
    lock inversion and deadlock with external callbacks (sashiko-bot).
- Added Patch 3/5 ("i3c: use actual_len for read transfers"):
  - Clarified @actual_len kerneldoc in <linux/i3c/device.h>
    (Adrian Hunter).
  - Incorporated Meagan Lloyd's controller updates (adi, dw, cdns,
    mipi-i3c-hci, renesas) so all I3C controller drivers populate
    xfer->actual_len on reads without mutating xfer->len
    (Adrian Hunter, Meagan Lloyd).
  - Updated mctp-i3c to read xfer.actual_len instead of xfer.len
    (Adrian Hunter).
- Updated Patch 4/5 ("i3c: add i3cdev module to expose i3c dev in /dev"):
  - Unified the UAPI around struct i3c_ioc_xfer and I3C_IOC_XFER(N) in
    <uapi/linux/i3c/i3cdev.h>, supporting both SDR and HDR modes via a
    mode field and union { __u8 rnw; __u8 cmd; } (Frank Li).
  - Added __u16 actual_len to struct i3c_ioc_xfer and updated
    i3cdev_do_xfer() to copy actual_len bytes to userspace and write
    actual_len back to userspace via put_user() on read transfers
    (Adrian Hunter, Frank Li).
  - Tracked active i3cdev instances in a private list (i3cdev_list)
    instead of using i3cdev_set_drvdata()/i3cdev_get_drvdata() so i3cdev
    never clobbers client drivers' dev->driver_data (Meagan Lloyd).
  - Validated direction field and verified that reserved padding pad[2] is
    zeroed (Greg KH).
  - Clamped read()/write() byte count to type_max(xfers.len) (u16) to
    prevent silent integer truncation and unbounded kernel allocations
    (sashiko-bot).
  - Used ida_alloc_max() capped to MINORMASK to prevent minor number
    overflow (sashiko-bot).
  - Added i3cdev_attach_lock mutex and idempotency check in
    i3cdev_attach()/i3cdev_detach() to serialize concurrent attach/detach
    calls (sashiko-bot).
  - Updated bus notifier to handle BUS_NOTIFY_DRIVER_NOT_BOUND and return
    NOTIFY_OK instead of raw errno values (sashiko-bot).
- Added Patch 5/5 ("tools: i3c: add i3ctransfer utility"):
  - Added tools/i3c/i3ctransfer.c (adapted from Vitor Soares's
    i3c-tools) updated for struct i3c_ioc_xfer, supporting SDR and HDR
    (-m, -c) modes and reporting actual_len bytes on reads
    (Wolfram Sang).
  - Note to Vitor Soares: Since your original i3ctransfer commit in
    i3c-tools did not include a Signed-off-by tag, could you please
    reply with your Signed-off-by / Acked-by for Patch 5/5?

Changes in v4:
- Dropped dev_open count tracking and used cdev_device_add/del with
  mutex locking to prevent use-after-free on detach
  (Greg KH, Wolfram Sang).
- Fixed 32/64-bit UAPI alignment and added compat_ptr_ioctl.
- Switched to dynamic minor allocation via IDA.

Sam Agazaryan (2):
  i3c: use actual_len for read transfers
  tools: i3c: add i3ctransfer utility

Vitor Soares (3):
  i3c: master: export i3c_masterdev_type
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 MAINTAINERS                            |   2 +
 drivers/i3c/Kconfig                    |  11 +
 drivers/i3c/Makefile                   |   1 +
 drivers/i3c/i3cdev.c                   | 491 +++++++++++++++++++++++++
 drivers/i3c/internals.h                |   4 +
 drivers/i3c/master.c                   |   9 +-
 drivers/i3c/master/adi-i3c-master.c    |   5 +-
 drivers/i3c/master/dw-i3c-master.c     |   2 +-
 drivers/i3c/master/i3c-master-cdns.c   |   5 +-
 drivers/i3c/master/mipi-i3c-hci/core.c |   2 +-
 drivers/i3c/master/renesas-i3c.c       |   3 +
 drivers/net/mctp/mctp-i3c.c            |  10 +-
 include/linux/i3c/device.h             |   2 +-
 include/uapi/linux/i3c/i3cdev.h        |  57 +++
 tools/Makefile                         |  13 +-
 tools/i3c/Build                        |   1 +
 tools/i3c/Makefile                     |  58 +++
 tools/i3c/i3ctransfer.c                | 307 ++++++++++++++++
 18 files changed, 966 insertions(+), 17 deletions(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h
 create mode 100644 tools/i3c/Build
 create mode 100644 tools/i3c/Makefile
 create mode 100644 tools/i3c/i3ctransfer.c

-- 
2.55.0.1082.g2b9226bbc0-goog



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
