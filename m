Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED18EC982CC
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tHKbgqhoaBm3rGXcI9adbl/WaCabUftxy+3OewwqVXs=; b=4H5YUhFYDwyHR+
	OnQMKyzcozxjGr1AxUBigqWqDm7KJuwsPQ1zbOzi5j2jci2mzoZNNUkPiEWo4zk3vAVV2wF2gVoZq
	zU24p+RWBn6Zqh79r03LkBdsVOWfeaAsMK/CnqpN2YDgL62l7a2cDX79IKha+V9wHMkrjuQ6jWAcp
	QxCNXVebRnwg3mWk+If8d7Z1M+T8f1CVlfRpFSi1rrOOCmwxojoH3CtznWUn/YArzwCEwMAMxo3VY
	MOJi9kVX7l2G9tAUfubdJA95yVbzR8BZSjF0B/UwzhDFGh9qmrc/v+5nY+koy6Bg5MKTXoJDeupPj
	zGiyS/xvV9vz3P3VgPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ESV-0000000HEWF-2gmC;
	Sun, 20 Sep 2026 10:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EST-0000000HEVY-3UH4
	for linux-i3c@bombadil.infradead.org;
	Sun, 20 Sep 2026 10:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=083nYyWU7EF9vQoxB6Xuy+lqNgfZK71CJI9FUajjX7M=; b=JHE619tpwcKjvX5EtKY3XmwRao
	RayHsp2BnOohDLxANp/jSMjQfE7i9VbiFI8Ro22a9s3RrqNFo6jWZRsOhvxiMl1px1G15XqpLcZ3P
	WnfPSEb8uW3e7HKvIdmibTVEWkDprFtTaVvh3aiK7DaF5/nhmnM3rXS7gvjZv9hypZdBexqtv+puq
	Rwt4Bcb6qFsaZ6/TiiZLIRzd0nzAy+nyrmYKrax2XNMDg7pLRILXry1j4xo+QIKe/XSgVsxAdVOxJ
	uNZbksivABzMWmShJytPv3cHAaJo5WNUU1Rb8pFOurChEDWIs7HJHjynLnybb9Bu/DAD5SMa7xFMi
	cvE/l7Xg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ESP-0000000BJM4-0RJn
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 10:07:40 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68KA6NGb81619077, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789898783;
	bh=083nYyWU7EF9vQoxB6Xuy+lqNgfZK71CJI9FUajjX7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=JLtLJPoFndxIwWTeoyvpaPL6/qaLgdV8aKmWG2/fzUIVYBV9n2x21g2gYjcZ0u9LI
	 rufFHigz84oquydkr02OyTyFPsaMHK89K7Fx1uP6SDb11wjZN+1/rfv8Zyy424Uy2h
	 ASc1E8XclIVOELxO7WsRaHkByxlOt0bq1uqdhufq9mpJTkzu+72QFUrE3uRHWIqmri
	 1xqoHZuUkFfI78eZCnEq9vChgXeu/eo7X8nAuoXommUBDFpEaaNy0sjTw7HcerncQn
	 FRSUseIkJMzKk0jSu75lZm+0Fp4bJChsjaSMW8wTS5kdZTvXk/HeY5idpP0AGebL/d
	 M6YJTCOtntkrQ==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68KA6NGb81619077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Sep 2026 18:06:23 +0800
Received: from localhost (172.29.57.213) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 18:06:23 +0800
From: <zain_zhou@realsil.com.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>, Lakshay Piplani <lakshay.piplani@nxp.com>
CC: <devicetree@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mfd@lists.linux.dev>, Wei Wang
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [RFC PATCH 0/4] Add support for Realtek RTS490x I3C hub
Date: Sun, 20 Sep 2026 18:04:57 +0800
Message-ID: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [172.29.57.213]
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_110738_217503_EAC8239D 
X-CRM114-Status: GOOD (  16.11  )
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

From: Yin Zhou <zain_zhou@realsil.com.cn>

Hi all,

This series adds support for the Realtek RTS490x family of I3C hubs.
The devices provide four or eight downstream target ports, which can be
configured as I3C buses or SMBus controller/target interfaces. They also
provide four programmable LDO outputs for the controller and target-port
power domains.

This RFC is based on the NXP P3H2x4x generic I3C hub framework series v17:

  [PATCH v17 0/8] Add support for NXP P3H2x4x I3C hub driver

The NXP dependency series is not included below and must be applied first.
It applies on top of current Linux mainline; the base commit used to build
and test this RFC is:

  940de590b839f71d6dc846160534bf202401b8b7

The dependency status and the final generic-hub API shape are an explicit
part of this RFC. If the generic framework is revised, this series will be
rebased accordingly. NXP's later v19 series will be evaluated for a future
revision of this RTS490x series and is not being used as the basis for this
RFC v1.

Patch overview:

  1. dt-bindings: i3c: Add Realtek RTS490x I3C hub support
     Add the RTS490x device-tree binding and register the binding with
     MAINTAINERS.

  2. mfd: Add driver for Realtek RTS490x I3C hub
     Add the I3C-only MFD parent, shared regmap, manufacturer matching,
     variant detection, protected-register lock, and child devices.

  3. regulator: rts490x: Add driver for on-die regulators
     Expose the four programmable LDOs through the regulator framework.
     Only regulator nodes explicitly present and enabled in DT are
     registered; omitted LDOs retain their existing hardware state.

  4. i3c: hub: Add Realtek RTS490x I3C hub support
     Add downstream I3C ports through the generic I3C hub framework and
     SMBus ports through Linux I2C adapters. SMBus controller completion
     and target receive handling use the hub self-IBI.

The first RFC intentionally has a limited scope:

  - The hub must be connected to the host through I3C.
  - GPIO and GPIO IRQ support are deferred to a follow-up series.
  - SMBus controller and target paths use IBI; polling fallback is not
    included.
  - Legacy I2C device discovery behind I3C-mode ports follows the existing
    behavior of the generic I3C master framework and has not been
    specifically validated on this hardware in this RFC.

Testing:

  - checkpatch.pl --strict, 0 errors/0 warnings across the series
  - dt_binding_check for the RTS490x binding
  - Cross-build validated for the MFD, regulator, and hub composite objects
  - git diff --check across the series
  - I3C and SMBus downstream ports have been functionally verified on
    target hardware.

Regards,
Yin Zhou

Yin Zhou (4):
  dt-bindings: i3c: Add Realtek RTS490x I3C hub support
  mfd: Add driver for Realtek RTS490x I3C hub
  regulator: rts490x: Add driver for on-die regulators
  i3c: hub: Add Realtek RTS490x I3C hub support

 .../bindings/i3c/realtek,rts490x.yaml         | 266 ++++++
 MAINTAINERS                                   |  11 +
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   3 +
 drivers/i3c/hub/rts490x-i3c-hub-core.c        | 444 +++++++++
 drivers/i3c/hub/rts490x-i3c-hub-i3c.c         | 150 ++++
 drivers/i3c/hub/rts490x-i3c-hub-smbus.c       | 839 ++++++++++++++++++
 drivers/i3c/hub/rts490x-i3c-hub.h             | 150 ++++
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rts490x-core.c                    | 131 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/rts490x-regulator.c         | 284 ++++++
 include/linux/mfd/rts490x.h                   |  53 ++
 15 files changed, 2364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-core.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-i3c.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-smbus.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub.h
 create mode 100644 drivers/mfd/rts490x-core.c
 create mode 100644 drivers/regulator/rts490x-regulator.c
 create mode 100644 include/linux/mfd/rts490x.h

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
