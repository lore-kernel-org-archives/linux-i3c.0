Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5019C982ED
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=65OECcOTFmTBZTLV3dPeCaLVOLcJsj0JRZLeCY2+azk=; b=E2kAsBI+8oikhoy3gC7l/408Fi
	qouPRTbe/gtEty0G1Kev1d/s+3vOaBDVJe6b06BEC7ip5xQXcVL/uM1+FMvrmneJA28PsWIeOsRcF
	JBOKCwSMaAEcfQW/FtJ+Dw4BPgSiU39gJbiYm8cgVnSqmJRPsvcoSxWQWbRQbTd30bT8KX83aIwj+
	BDa03r+/Ih2sIH1NQuU7Ft9Q6lEgwcQvbvSt7DXBQd5lgxR8eMmXyljGCLn8jIGiTGK0PhZF1cxEJ
	zBHb7/6XzvYL7rX4M/rc/Wfo2hwHOcVElS48AlXClTSvu9XzwKSoI0QH1xTJ8AcdZoNxC4d+/V8zK
	z3vtZ1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6o-00000003dZk-1zGY;
	Mon, 21 Sep 2026 23:07:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6n-00000003dZG-1CGO
	for linux-i3c@bombadil.infradead.org;
	Mon, 21 Sep 2026 23:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RR0zZiXpRm2WDANYV1GsiZi8Wtsj9oHp4lONKDVQ0To=; b=ZHtM11gyGQbMldMHPRQl67vlPG
	RCk/Zs7PD4WlbV4fNQuZKim21EKHN9nVTN22Au2dgxuDZ/aTVtfpRr8GmHosiegPOnBHZnVyM32uq
	JmNIwV7JeEfvBsSXzGBItOX/8o9rKzfG2Ju5EBkcGvXGGabv1YhP3pjIfIBlUgUt7D+4b6mlRe//4
	Iu7kK/5W9BCRn72iJODvb1764onsOwDOR0abwBsVj6IPsvJemHIEtYoh+nmgfWfRAxFEMIafU47kE
	c0T+1gQ/i+tJzTaG5GEzHdRFkOboZOpGNERl8VArx0Tl/MqetQwuuHV0vihM2+LZJJAE6C/e4QPlO
	PM7GjSXQ==;
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8n6W-0000000Cu2J-1OIG
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:07:28 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so4303064a91.0
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 16:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032033; x=1790636833; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR0zZiXpRm2WDANYV1GsiZi8Wtsj9oHp4lONKDVQ0To=;
        b=KQZgz0vwefiS+uk33RhWDLUKlfFEYn3FLS0U6vPcH5vBwxPRA3DMQXukOM5TB8Z2oZ
         rSjI6vd8vznnq68vfY6vw6Fh2G4WJHIXmlBKBaQsrLTV4L9MGHDlXq3G1PDepTNrVMfK
         ixU89D15kxS1L1i8onmmhogFFvRl2a93Y/0XodC+1SbgHbx9A15qlPNOXFOkbej0//sL
         wVzDFCrC4tCfBI0FID0ZNvoVlIz3xTa4PLackzGzGsRJTyL6ARrJUWRb/Ce7WknTG4np
         9vtKbjJeE4RXqg0porXJ0yp2Lc81XJx9H3oE0hJn1Sd6Yy5qU5A3ywmW2twhP1K04Q5/
         qikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032033; x=1790636833;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RR0zZiXpRm2WDANYV1GsiZi8Wtsj9oHp4lONKDVQ0To=;
        b=f04ysCd12kvSr0eNrklY2GJnju7RlKsVal8tUDeGIidYkT3dddApL6TjjMXz1fzAyW
         qCpcN5kInylxddKMUq1lHZt1DVdzO+IEZR54rIdqw+RTsGMFCwy8UZ7YB2AMweGRgPY0
         NTVDzM3EetS9mWL+wMtbKIWdwbabFB3IXgOOPt95iAC6axKTrPg7AuywEx97eUo7eE4y
         Y9HjDsgKwn7/Tni7ai9Upwi/uoDvFu0pzWTWjqQlJrZQEdfIL1KkOJNanujIJ33pdhpv
         gRy75cMyBZIMSzNpbEey5B8V2XFUg0Hnj89j5O+Zp0yX2iXeo2lwup0874atJRCOYsLk
         itTg==
X-Gm-Message-State: AFuF++lUswxyaIq0zkkHRxmrS4RWFyfcjkbyt2Z42oWSpoaUHtX7pYP8
	kdre0jytv1ijfBHH+UF+mG3uqi76vT1e+QciD6gRv9h/mL/Q1eqzI2VhcwnzVbmeW5k4yZvCfG5
	4xocqWsC3vKP7w1ZpyuTh3emzfcndKqQEvCcZcSfLy/9awAnJULwy/IyX8+HQWIfmWxqWr6Ux3G
	emBh54GkwJ5O0BOqZxt79A3iVsAoICQDcLY8gieReNkesdM9LzklPfRJN4Aytziv8ENN9t94T33
	QwGXA==
X-Received: from dldz19-n1.prod.google.com ([2002:a05:701b:4193:10b0:143:9704:de05])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc4b:b0:3a0:2900:f577 with SMTP id 98e67ed59e1d1-3a02900f8f6mr9538685a91.51.1790032032957;
 Mon, 21 Sep 2026 16:07:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:03 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-6-samagazaryan@google.com>
Subject: [PATCH v5 5/5] tools: i3c: add i3ctransfer utility
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
X-CRM114-CacheID: sfid-20260922_000723_970557_5B29479F 
X-CRM114-Status: GOOD (  25.79  )
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

Add the i3ctransfer userspace utility to tools/i3c/ for testing and
interacting with I3C target devices via /dev/bus/i3c/* character
devices.

Based on the i3ctransfer tool from i3c-tools by Vitor Soares, updated
for the unified I3C_IOC_XFER UAPI (struct i3c_ioc_xfer):
  - Supports SDR and HDR (HDR-DDR, HDR-TSP, HDR-TSL) transfer modes
    via -m/--mode and -c/--command options.
  - Reports actual_len bytes received on read transfers.

Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
Note to Vitor Soares:
  This patch ports your GPL-2.0 i3ctransfer utility from i3c-tools into
  tools/i3c/ and updates it for struct i3c_ioc_xfer (SDR/HDR modes and
  actual_len read reporting). Since the original GitHub commit did not
  include a Signed-off-by tag, could you please reply with your
  Signed-off-by or Acked-by so we can properly record your sign-off?

 MAINTAINERS             |   1 +
 tools/Makefile          |  13 +-
 tools/i3c/Build         |   1 +
 tools/i3c/Makefile      |  58 ++++++++
 tools/i3c/i3ctransfer.c | 307 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 374 insertions(+), 6 deletions(-)
 create mode 100644 tools/i3c/Build
 create mode 100644 tools/i3c/Makefile
 create mode 100644 tools/i3c/i3ctransfer.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 30a5cb12c4f0..8a4166ebc9dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12365,6 +12365,7 @@ F:	drivers/i3c/
 F:	include/dt-bindings/i3c/
 F:	include/linux/i3c/
 F:	include/uapi/linux/i3c/
+F:	tools/i3c/
 
 IBM Operation Panel Input Driver
 M:	Eddie James <eajames@linux.ibm.com>
diff --git a/tools/Makefile b/tools/Makefile
index cb40961a740f..7c17e7555fd7 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -20,6 +20,7 @@ help:
 	@echo '  freefall               - laptop accelerometer program for disk protection'
 	@echo '  gpio                   - GPIO tools'
 	@echo '  hv                     - tools used when in Hyper-V clients'
+	@echo '  i3c                    - I3C tools'
 	@echo '  iio                    - IIO tools'
 	@echo '  intel-speed-select     - Intel Speed Select tool'
 	@echo '  kvm_stat               - top-like utility for displaying kvm statistics'
@@ -70,7 +71,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-counter dma firewire hv guest bootconfig spi usb virtio mm bpf iio gpio objtool leds wmi firmware debugging tracing: FORCE
+counter dma firewire hv guest bootconfig spi usb virtio mm bpf i3c iio gpio objtool leds wmi firmware debugging tracing: FORCE
 	$(call descend,$@)
 
 bpf/%: FORCE
@@ -126,7 +127,7 @@ ynl: FORCE
 all: acpi counter cpupower dma gpio hv firewire \
 		perf selftests bootconfig spi turbostat usb \
 		virtio mm bpf x86_energy_perf_policy \
-		tmon freefall iio objtool kvm_stat wmi \
+		tmon freefall i3c iio objtool kvm_stat wmi \
 		debugging tracing thermal thermometer thermal-engine ynl
 
 acpi_install:
@@ -135,7 +136,7 @@ acpi_install:
 cpupower_install:
 	$(call descend,power/$(@:_install=),install)
 
-counter_install dma_install firewire_install gpio_install hv_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install mm_install bpf_install objtool_install wmi_install debugging_install tracing_install:
+counter_install dma_install firewire_install gpio_install hv_install i3c_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install mm_install bpf_install objtool_install wmi_install debugging_install tracing_install:
 	$(call descend,$(@:_install=),install)
 
 selftests_install:
@@ -166,7 +167,7 @@ ynl_install:
 	$(call descend,net/$(@:_install=),install)
 
 install: acpi_install counter_install cpupower_install dma_install gpio_install \
-		hv_install firewire_install iio_install \
+		hv_install firewire_install i3c_install iio_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install mm_install bpf_install x86_energy_perf_policy_install \
 		tmon_install freefall_install objtool_install kvm_stat_install \
@@ -179,7 +180,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-counter_clean dma_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean firmware_clean debugging_clean tracing_clean:
+counter_clean dma_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean i3c_clean iio_clean gpio_clean objtool_clean leds_clean firmware_clean debugging_clean tracing_clean:
 	$(call descend,$(@:_clean=),clean)
 
 libapi_clean:
@@ -227,7 +228,7 @@ ynl_clean:
 
 clean: acpi_clean counter_clean cpupower_clean dma_clean hv_clean firewire_clean \
 		perf_clean selftests_clean turbostat_clean bootconfig_clean spi_clean usb_clean virtio_clean \
-		mm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
+		mm_clean bpf_clean i3c_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 		freefall_clean build_clean libbpf_clean libsubcmd_clean \
 		gpio_clean objtool_clean leds_clean wmi_clean firmware_clean debugging_clean \
 		intel-speed-select_clean tracing_clean thermal_clean thermometer_clean thermal-engine_clean \
diff --git a/tools/i3c/Build b/tools/i3c/Build
new file mode 100644
index 000000000000..6a22328ad983
--- /dev/null
+++ b/tools/i3c/Build
@@ -0,0 +1 @@
+i3ctransfer-y += i3ctransfer.o
diff --git a/tools/i3c/Makefile b/tools/i3c/Makefile
new file mode 100644
index 000000000000..43ce8769185b
--- /dev/null
+++ b/tools/i3c/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only
+include ../scripts/Makefile.include
+
+bindir ?= /usr/bin
+
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Do not use make's built-in rules
+# (this improves performance and avoids hard-to-debug behaviour);
+MAKEFLAGS += -r
+
+CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+
+ALL_TARGETS := i3ctransfer
+ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
+
+all: $(ALL_PROGRAMS)
+
+export srctree OUTPUT CC LD CFLAGS
+include $(srctree)/tools/build/Makefile.include
+
+#
+# We need the following to be outside of kernel tree
+#
+$(OUTPUT)include/linux/i3c: ../../include/uapi/linux/i3c
+	mkdir -p $(OUTPUT)include/linux/i3c 2>&1 || true
+	ln -sf $(CURDIR)/../../include/uapi/linux/i3c/i3cdev.h $@
+
+prepare: $(OUTPUT)include/linux/i3c
+
+#
+# i3ctransfer
+#
+I3CTRANSFER_IN := $(OUTPUT)i3ctransfer-in.o
+$(I3CTRANSFER_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=i3ctransfer
+$(OUTPUT)i3ctransfer: $(I3CTRANSFER_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+clean:
+	rm -f $(ALL_PROGRAMS)
+	rm -rf $(OUTPUT)include/
+	find $(or $(OUTPUT),.) -name '*.o' -delete
+	find $(or $(OUTPUT),.) -name '\.*.o.d' -delete
+	find $(or $(OUTPUT),.) -name '\.*.o.cmd' -delete
+
+install: $(ALL_PROGRAMS)
+	install -d -m 755 $(DESTDIR)$(bindir);		\
+	for program in $(ALL_PROGRAMS); do		\
+		install $$program $(DESTDIR)$(bindir);	\
+	done
+
+FORCE:
+
+.PHONY: all install clean FORCE prepare
diff --git a/tools/i3c/i3ctransfer.c b/tools/i3c/i3ctransfer.c
new file mode 100644
index 000000000000..a5b071e63530
--- /dev/null
+++ b/tools/i3c/i3ctransfer.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Synopsys, Inc. and/or its affiliates.
+ * Copyright (c) 2026 Google LLC
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#include <ctype.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include <linux/i3c/i3cdev.h>
+
+#define VERSION "0.2"
+
+static const char *sopts = "d:m:c:r:w:vh";
+static const struct option lopts[] = {
+	{"device",		required_argument,	NULL,	'd' },
+	{"mode",		required_argument,	NULL,	'm' },
+	{"command",		required_argument,	NULL,	'c' },
+	{"read",		required_argument,	NULL,	'r' },
+	{"write",		required_argument,	NULL,	'w' },
+	{"help",		no_argument,		NULL,	'h' },
+	{"version",		no_argument,		NULL,	'v' },
+	{0, 0, 0, 0}
+};
+
+static void print_usage(const char *name)
+{
+	fprintf(stderr, "usage: %s options...\n", name);
+	fprintf(stderr, "  options:\n");
+	fprintf(stderr, "    -d --device  <dev>    device to use.\n");
+	fprintf(stderr,
+		"    -m --mode    <mode>   sdr (default), hdr-ddr, hdr-tsp, hdr-tsl.\n");
+	fprintf(stderr,
+		"    -c --command <cmd>    HDR command byte (0x00-0x7f W, 0x80-0xff R).\n");
+	fprintf(stderr, "    -r --read    <len>    read data length in bytes.\n");
+	fprintf(stderr,
+		"    -w --write   <block>  write comma-separated bytes (e.g. 0x01,0x02).\n");
+	fprintf(stderr, "    -h --help             output usage message and exit.\n");
+	fprintf(stderr, "    -v --version          output version number and exit.\n");
+}
+
+static int parse_mode(const char *arg, uint8_t *mode)
+{
+	char *endptr;
+	long val;
+
+	if (!strcmp(arg, "sdr")) {
+		*mode = I3C_XFER_MODE_SDR;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-ddr") || !strcmp(arg, "ddr")) {
+		*mode = I3C_XFER_MODE_HDR_DDR;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-tsp") || !strcmp(arg, "tsp")) {
+		*mode = I3C_XFER_MODE_HDR_TSP;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-tsl") || !strcmp(arg, "tsl")) {
+		*mode = I3C_XFER_MODE_HDR_TSL;
+		return 0;
+	}
+
+	val = strtol(arg, &endptr, 0);
+	if (*endptr == '\0' &&
+	    (val == I3C_XFER_MODE_HDR_DDR ||
+	     val == I3C_XFER_MODE_HDR_TSP ||
+	     val == I3C_XFER_MODE_HDR_TSL ||
+	     val == I3C_XFER_MODE_SDR)) {
+		*mode = (uint8_t)val;
+		return 0;
+	}
+
+	fprintf(stderr, "Error: invalid transfer mode '%s'\n", arg);
+	return -1;
+}
+
+static int rx_args_to_xfer(struct i3c_ioc_xfer *xfer, char *arg,
+			   uint8_t mode, int cmd)
+{
+	char *endptr;
+	uint8_t *tmp;
+	long len;
+
+	len = strtol(arg, &endptr, 0);
+	if (*endptr != '\0' || len <= 0 || len > UINT16_MAX) {
+		fprintf(stderr, "Error: invalid read length '%s'\n", arg);
+		return -1;
+	}
+
+	if (mode == I3C_XFER_MODE_SDR) {
+		xfer->rnw = I3C_DEV_DIR_READ;
+	} else {
+		if (cmd < 0 || !(cmd & 0x80)) {
+			fprintf(stderr,
+				"Error: HDR read requires command (-c) in range 0x80..0xff\n");
+			return -1;
+		}
+		xfer->cmd = (uint8_t)cmd;
+	}
+
+	tmp = calloc(len, sizeof(uint8_t));
+	if (!tmp)
+		return -1;
+
+	xfer->mode = mode;
+	xfer->len = (uint16_t)len;
+	xfer->data = (uintptr_t)tmp;
+
+	return 0;
+}
+
+static int w_args_to_xfer(struct i3c_ioc_xfer *xfer, char *arg,
+			  uint8_t mode, int cmd)
+{
+	char *data_ptrs[256];
+	int len, i = 0;
+	uint8_t *tmp;
+
+	if (mode == I3C_XFER_MODE_SDR) {
+		xfer->rnw = I3C_DEV_DIR_WRITE;
+	} else {
+		if (cmd < 0 || (cmd & 0x80)) {
+			fprintf(stderr,
+				"Error: HDR write requires command (-c) in range 0x00..0x7f\n");
+			return -1;
+		}
+		xfer->cmd = (uint8_t)cmd;
+	}
+
+	data_ptrs[i] = strtok(arg, ",");
+	while (data_ptrs[i] && i < 255)
+		data_ptrs[++i] = strtok(NULL, ",");
+
+	if (i == 0) {
+		fprintf(stderr, "Error: empty write data block\n");
+		return -1;
+	}
+
+	tmp = calloc(i, sizeof(uint8_t));
+	if (!tmp)
+		return -1;
+
+	for (len = 0; len < i; len++) {
+		char *endptr;
+		long val = strtol(data_ptrs[len], &endptr, 0);
+
+		if (*endptr != '\0' || val < 0 || val > UINT8_MAX) {
+			fprintf(stderr, "Error: invalid byte value '%s'\n",
+				data_ptrs[len]);
+			free(tmp);
+			return -1;
+		}
+		tmp[len] = (uint8_t)val;
+	}
+
+	xfer->mode = mode;
+	xfer->len = (uint16_t)len;
+	xfer->data = (uintptr_t)tmp;
+
+	return 0;
+}
+
+static void print_rx_data(const struct i3c_ioc_xfer *xfer)
+{
+	const uint8_t *tmp = (const uint8_t *)(uintptr_t)xfer->data;
+	int i;
+
+	fprintf(stdout, "  received data (%u bytes):\n", xfer->actual_len);
+	for (i = 0; i < xfer->actual_len; i++)
+		fprintf(stdout, "    0x%02x\n", tmp[i]);
+}
+
+int main(int argc, char *argv[])
+{
+	uint8_t mode = I3C_XFER_MODE_SDR;
+	struct i3c_ioc_xfer *xfers;
+	char *device = NULL;
+	int file, ret, opt, i;
+	int nxfers = 0;
+	int cmd = -1;
+
+	while ((opt = getopt_long(argc, argv, sopts, lopts, NULL)) != EOF) {
+		switch (opt) {
+		case 'h':
+			print_usage(argv[0]);
+			return EXIT_SUCCESS;
+		case 'v':
+			fprintf(stderr, "%s - %s\n", argv[0], VERSION);
+			return EXIT_SUCCESS;
+		case 'd':
+			device = optarg;
+			break;
+		case 'm':
+			if (parse_mode(optarg, &mode))
+				return EXIT_FAILURE;
+			break;
+		case 'c': {
+			char *endptr;
+			long val = strtol(optarg, &endptr, 0);
+
+			if (*endptr != '\0' || val < 0 || val > UINT8_MAX) {
+				fprintf(stderr, "Error: invalid command '%s'\n",
+					optarg);
+				return EXIT_FAILURE;
+			}
+			cmd = (int)val;
+			break;
+		}
+		case 'r':
+		case 'w':
+			nxfers++;
+			break;
+		default:
+			print_usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (!device || nxfers == 0) {
+		print_usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
+	file = open(device, O_RDWR);
+	if (file < 0) {
+		fprintf(stderr, "Error: failed to open %s: %s\n",
+			device, strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	xfers = calloc(nxfers, sizeof(*xfers));
+	if (!xfers) {
+		close(file);
+		return EXIT_FAILURE;
+	}
+
+	optind = 1;
+	nxfers = 0;
+	cmd = -1;
+
+	while ((opt = getopt_long(argc, argv, sopts, lopts, NULL)) != EOF) {
+		switch (opt) {
+		case 'h':
+		case 'v':
+		case 'd':
+		case 'm':
+			break;
+		case 'c':
+			cmd = (int)strtol(optarg, NULL, 0);
+			break;
+		case 'r':
+			if (rx_args_to_xfer(&xfers[nxfers], optarg, mode, cmd)) {
+				ret = EXIT_FAILURE;
+				goto err_free;
+			}
+			nxfers++;
+			break;
+		case 'w':
+			if (w_args_to_xfer(&xfers[nxfers], optarg, mode, cmd)) {
+				ret = EXIT_FAILURE;
+				goto err_free;
+			}
+			nxfers++;
+			break;
+		}
+	}
+
+	if (ioctl(file, I3C_IOC_XFER(nxfers), xfers) < 0) {
+		fprintf(stderr, "Error: transfer failed: %s\n", strerror(errno));
+		ret = EXIT_FAILURE;
+		goto err_free;
+	}
+
+	for (i = 0; i < nxfers; i++) {
+		bool is_read = (mode == I3C_XFER_MODE_SDR) ?
+			       (xfers[i].rnw == I3C_DEV_DIR_READ) :
+			       (xfers[i].cmd & 0x80);
+
+		fprintf(stdout, "Success on message %d\n", i);
+		if (is_read)
+			print_rx_data(&xfers[i]);
+	}
+
+	ret = EXIT_SUCCESS;
+
+err_free:
+	for (i = 0; i < nxfers; i++)
+		free((void *)(uintptr_t)xfers[i].data);
+	free(xfers);
+	close(file);
+
+	return ret;
+}
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
