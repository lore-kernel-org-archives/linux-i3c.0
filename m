Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCDEE7542B
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Oct 2023 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz7a68HMZLx0oantYcqOqeHh2+BQAStI0VDLd8Z77Yo=; b=UwAC6eohcp60Bs
	XBNN8D9ROaWYI6qWkRiMZ/iDTzB6l05VAWmqvnkGCnLI9Ncohd9C4Uug5aQPccFZFL8Dishn1NbPq
	Lfb3PlSac09wbN+ep8Sa9PaC1T5sqnJuWLHym4nDmeYUsLlOBvJrTTYdxkrgc7SJU7Vy9RBHwa9E+
	WUs6SXMJODLjl+AX/tnOUhShbwBHKO1K/rcmXPV9mcxapceDrAd7KX3lfh+k/VhaCMmXk652SoUwO
	vxUb4QH3HZkz6Gn84Bm8Gc9Z7JBuYSmC+JsCfNwPP97Cluw6girxvg1UfP1eqW3cEkyQyvxYfTvUv
	ZvqK1YpH6HJL9+TNZ97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ3y-00DvbN-2x;
	Tue, 03 Oct 2023 06:39:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ3v-00DvYy-1w
	for linux-i3c@lists.infradead.org;
	Tue, 03 Oct 2023 06:39:21 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id F0FCE20141; Tue,  3 Oct 2023 14:39:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696315148;
	bh=wE1y/0uR75zUR155cxXByfX4Fp6lOFAIQbc2wf3iWk0=;
	h=From:To:Cc:Subject:Date;
	b=XG1OeY6dk4t+K7fAOHAqMrgRSbLKctXJ5w24PeZcJtNf3yKhC4fWYyitJLNtDLlfx
	 f72LcaWtJQfkQURqMPK7HgsSv8ZESqXyHvDjDZQyzg21YCWyp/FNag42fSoK6kF7u2
	 ttSaGb2RO+16nZQpqo7tONlZvIRAdPEsVmSycjy5hl7Dafugh3n/TIdQAl6XRp6V7u
	 6gx2LW53UdGfaxi5N+PVJbUZtEyy6GE0I0gonilqXeZ4OhoSLk2urdtz162T5My5Gt
	 Wo5nHhz3j5qun3j2zwDi14lIfWEj42gBbaWER/604jN5nAhWbrz549o1GBzZiDlCq/
	 QThFmUyvwaJPA==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next v3 0/3] I3C MCTP net driver
Date: Tue,  3 Oct 2023 14:36:21 +0800
Message-Id: <20231003063624.126723-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_233919_858620_58675492 
X-CRM114-Status: GOOD (  12.27  )
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

This series adds an I3C transport for the kernel's MCTP network
protocol. MCTP is a communication protocol between system components
(BMCs, drives, NICs etc), with higher level protocols such as NVMe-MI or
PLDM built on top of it (in userspace). It runs over various transports
such as I2C, PCIe, or I3C.

The mctp-i3c driver follows a similar approach to the kernel's existing
mctp-i2c driver, creating a "mctpi3cX" network interface for each
numbered I3C bus. Busses opt in to support by adding a "mctp-controller"
property to the devicetree:

&i3c0 {
        mctp-controller;
}

The driver will bind to MCTP class devices (DCR 0xCC) that are on a
supported I3C bus. Each bus is represented by a `struct mctp_i3c_bus`
that keeps state for the network device. An individual I3C device
(struct mctp_i3c_device) performs operations using the "parent"
mctp_i3c_bus object. The I3C notify/enumeration patch is needed so that
the mctp-i3c driver can handle creating/removing mctp_i3c_bus objects as
required.

The mctp-i3c driver is using the Provisioned ID as an identifier for
target I3C devices (the neighbour address), as that will be more stable
than the I3C dynamic address. The driver internally translates that to a
dynamic address for bus operations.

The driver has been tested using an AST2600 platform. A remote endpoint 
has been tested against QEMU, as well as using the target mode support 
in Aspeed's vendor tree.

I3C maintainers have acked merging this through net-next tree.

Thanks,
Matt

---

v3:

- Use get_unaligned_be48()
- Use kthread_run()
- Don't set net namespace

v2:

- Rebased to net-next
- Removed unnecessary pr_ printing
- Fixed reverse christmas tree ordering
- Reworded DT property description to match I2C

Jeremy Kerr (1):
  i3c: Add support for bus enumeration & notification

Matt Johnston (2):
  dt-bindings: i3c: Add mctp-controller property
  mctp i3c: MCTP I3C driver

 .../devicetree/bindings/i3c/i3c.yaml          |   6 +
 drivers/i3c/master.c                          |  35 +
 drivers/net/mctp/Kconfig                      |   9 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-i3c.c                   | 760 ++++++++++++++++++
 include/linux/i3c/master.h                    |  11 +
 6 files changed, 822 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
