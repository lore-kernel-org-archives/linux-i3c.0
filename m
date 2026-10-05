Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76FBCA5FF0
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Oct 2026 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MFKQah9WcE8id1ZPENHL3QbQ6sPV0R85rc07PlCU07I=; b=BkmZ4vW3lyXeMs
	uuo+4svmTSTwvM+0ycbrZtObHe0jn9S4S/z3pkKzQpxZ6sXCXrbK/IqoVL+7Q6kTCUv/FadWq0yBX
	JdIxRgTktbfi49fYPvIsRH+TW7hT8MjYrnyEQGWpvvlDtfWwLe9kTR018fr7StLU48i8wTT3Q5VI7
	VrscJpDSmwrEBrx0Ncj2ydsIpfDHp4WFweVo7kWrWtjX9UBdIwXxXrckptf4LgxkKvHZk+BArvYYr
	2oqaWWokGAiOTlONKMeLHMdyI/DR/MIoq1CvzNSUnU6jSR2VhPtAVWUBrVPPC8yJ1oq6lVogmozGi
	rltdMnX6mJdWZqSE2KKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrZ-0000000GmVi-1WPZ;
	Mon, 05 Oct 2026 15:44:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrX-0000000GmVR-1sbG
	for linux-i3c@lists.infradead.org;
	Mon, 05 Oct 2026 15:44:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0FA560514;
	Mon,  5 Oct 2026 15:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F21F000FF;
	Mon,  5 Oct 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215062;
	bh=duh1CZ14r9XeWHOeo0rXi5XjMvhGZKGUxzSBxfATc50=;
	h=From:To:Cc:Subject:Date;
	b=G+g/06BuFkh+yJNEzPkCi7GR+Zd+Zx0FLylJfoZy0t4QkmS5nyblDCuBAeaEauFxn
	 zPLlCNIa/MUr/Zjy7l7eDxO237X1br1k19YzsTqUWFMA2gSlQtp1d4uChcqo1WTNc/
	 Rz0kiBk4CUG5NOzFxRyNfJBFLeCpoN5uL89vaHQUlz0QMUawaGKSntlZHjyI1XRuVP
	 AdUeciarYt78LmcWCaKwPbGYGbpCRKv/9q3DXQqQDbfK7C2V+vlKmT4uWbBquVXkuQ
	 YC/inZJras+Ljm5Y6iZkeUQt5U0Dlp7iJE633mwdQHILj5FZct5PT5QsgdkV5PNQEC
	 wuETUD4H6b/XQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i3c: dw: Support Synaptics sl2610 i3c
Date: Mon,  5 Oct 2026 23:24:22 +0800
Message-ID: <20261005152425.25319-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

This is subset of the "arm64: add Synaptics SL261X SoCs and RDK boards"
series.

Support the Synaptics SL2610 SoC I3C controller, which is compatible
with the Synopsys DesignWare I3C.

Since v1:
 - collect Reviewed-by tag
 - use sl2610 instead of sl261x
 - restrict altera i3c reset to 1
 - send as a separate series for i3c subsystem

Jisheng Zhang (3):
  dt-bindings: i3c: dw: support up to two reset lines
  i3c: dw: switch to array-based exclusive reset control
  dt-bindings: i3c: Add Synaptics sl2610 i3c

 .../bindings/i3c/snps,dw-i3c-master.yaml      | 16 +++++++++++--
 drivers/i3c/master/dw-i3c-master.c            | 24 ++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.h            |  2 +-
 3 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
