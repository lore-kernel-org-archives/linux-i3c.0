Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAAAC10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA5720693
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r58PLCdw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QuTwox4f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA5720693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iqe91aMcHPVorMavlyWADLFOdW9ESxMI7IzBo94DuSc=; b=r58
	PLCdwA67Ef3OAsR27zlpt1ghjvlk0Iro5tOOqrUV9NPaxuMbUmq9DSzRvACMcukz274PKZ0Rbomr9
	HFvJiWkW97pwVnGYv1PDcPVpDn3mdP7yArAEr270Ta86toFlQO6H69QCaHAvy7QHkswtenrXqbw6F
	8pgrG8KeYazdhTM5lYfgSsw5appmaQj7FNGjF83LDuLcXx546POKX+Hcaf15tR5WSCnYGYXWKMc5Z
	WRrtar11WabA/4QvNq5PZ8noSntNs4S0/fSlEzyMNHeAgiLlttExbLC3fBv8SLLdpQCc7fd8f0ZCF
	oPoCBtAvCQ9OxSs2JCZa9wyxd1jmbWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGM0p-0001F8-Er; Tue, 16 Apr 2019 11:12:27 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG79O-0001PU-RE
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 19:20:20 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 5E8AA10C10A5;
 Mon, 15 Apr 2019 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555356018; bh=HRXqFmPCXEH7TTVf3uZt+wISGcBLOQ+X33KGrRmTZYo=;
 h=From:To:Cc:Subject:Date:From;
 b=QuTwox4fImyg10VuN2qmFVPzfB/7glcjeHNogLyaMZqWZFMIwQ302pJLoqWkROn8i
 j786ZXD1IDL/cNYpLd9m5kjvKEoPaX9fOtIOWDhZ7NjvXO9GRpo4VP8Elyi7FesauT
 /gcAg0oxndbUVjjic9g2iD4EM5D3D6fe+H0nwyiPvZVKUqzgu9DewZaFomxYbKU6yp
 BkTmqrAUWYwHv4P6mSijDiCEBbgQ0nE9SqUL+ul9ZC30NoNqApIPatDjFlMYc9QO1u
 Y43WzRG9fHXjTaPWTVlGof6jmC26ufY1/OF1zroNOiJhx9YBmYNKIgoEh3qGwPQhIK
 V4mnuHYnxYqfw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id CF2CD5467;
 Mon, 15 Apr 2019 12:19:43 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add ST lsm6dso i3c suppport
Date: Mon, 15 Apr 2019 21:19:38 +0200
Message-Id: <cover.1555354268.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_122019_105446_74E700E6 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:12:26 -0700
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
Cc: lars@metafoo.de, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 joao.pinto@synopsys.com, rafael@kernel.org,
 Vitor Soares <vitor.soares@synopsys.com>, broonie@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, lorenzo.bianconi83@gmail.com,
 jic23@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Vitor Soares (3):
  remap: Add i3c bus support
  i3c: Add i3c_get_device_id helper
  iio: imu: st_lsm6dsx: Add i3c basic support

 drivers/base/regmap/Kconfig                 |  6 ++-
 drivers/base/regmap/Makefile                |  1 +
 drivers/base/regmap/regmap-i3c.c            | 62 ++++++++++++++++++++++++++
 drivers/i3c/device.c                        |  8 ++++
 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 67 +++++++++++++++++++++++++++++
 include/linux/i3c/device.h                  |  1 +
 include/linux/regmap.h                      | 20 +++++++++
 9 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
