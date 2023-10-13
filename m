Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CB2CDB483
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Oct 2023 04:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/4iZw2d5Cv62xkW+NVRk2CxxNi4tQ3WLanH8Jw9Kz7U=; b=GpyPwANy347gu3
	BcCz4vCUtVReC8rArI66CNh/iK+veWxPr9YbuhzZMR4NzPj92zgeIwOhWhSjF9UWyY9NpD4gGvnTE
	DXJLqNNPEQrGlwqeLqeZ5KNwwnknAD5tj8TMN7XH4+gI6cLKYTFNjPNJd/PZbNRkw72zDnmTuFoJY
	3QuX3kfrI+4VCWgTrZQ3dqOVij14p9XUaeo9o18Qe9SZX3VWg8CsRLZUZdakYHnnUdTSBC0vQwH+u
	yqol12fIUxrZ3CvURbvBghg+kDgIJh2TCYZtP1ztQxH4MWRU0JGOCcqP93lKhdri05dfL34JsDieU
	C8TmpM6ytGVNIDJYsojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr9Rs-002QW1-1Z;
	Fri, 13 Oct 2023 04:06:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr9Ro-002QU0-0G
	for linux-i3c@lists.infradead.org;
	Fri, 13 Oct 2023 04:06:51 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id AE3062001E; Fri, 13 Oct 2023 12:06:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1697169996;
	bh=KJt7lTCB5sxACrtL1ItOeJi93rzBwWIsEjBgwX79PAQ=;
	h=From:To:Cc:Subject:Date;
	b=WA1+AMKxXOSKKlQlvcJKMsxQBLNvDYwLThnW84chJOwMMByk+yer9UHXTj7Ow5bZp
	 6Go1dc/JD7K+yqYc7q3sw7KAoJq6BvhemqAPsPYkNJezr/PbGX/eH4ZTiF9KlfQ4Vt
	 q85qS6zWR1a5Dnn16HNQlcIEZVx43E8UKMmsZFhJIRN6bh9c0in5ML42goFRy5BE1o
	 1HhMzxz+FC4B3+5bdbJo3MqPupM60Nihz1euKoPIaPSoKADGrgD4IJfL2sr14S/KrW
	 U/P6aNf/S+NRpRFQcnf63GLpQfLDR2ROx/ju/sur4D84C5nsxKfKBRsuML+NTUAGj1
	 jnLAHIgbTLerw==
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
	Conor Dooley <conor+dt@kernel.org>,
	miquel.raynal@bootlin.com
Subject: [PATCH net-next v6 0/3] I3C MCTP net driver
Date: Fri, 13 Oct 2023 12:06:22 +0800
Message-ID: <20231013040628.354323-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_210648_495602_00A6F897 
X-CRM114-Status: GOOD (  12.42  )
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

Thank you for the review Paolo, I've made those changes.

v6:

- Use multiple labels for error path handling
- Fix error handling from mctp_i3c_probe()
- Use spinlock_bh() instead for tx_lock
- Remove stale TODO comment (it had been tested)

v5:

- Use #define for constant initializer, fixes older gcc
- Wrap lines at 80 characters, fix parenthesis alignment 

v4:

- Add asm/unaligned.h include

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
 drivers/net/mctp/mctp-i3c.c                   | 755 ++++++++++++++++++
 include/linux/i3c/master.h                    |  11 +
 6 files changed, 817 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
