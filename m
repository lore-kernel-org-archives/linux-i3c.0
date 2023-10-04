Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C016AE8FDC7
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Oct 2023 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IEy6R2aqcQWHqvjBWi365WiBdLW0N7+WCPr+q2U+9Y=; b=LQ2KVToOP+OLa4
	kPxx21lT+cVaaapwlQ+1yXjI3ZFBxSCrdHwZvCBy37BIt7qEt7wBoePnAEEedeY0vF7i8+BNywX2i
	2iv1TxfK8Jcr1YIj/7vTOQ9gKyigni5WZmhOxXllF1PoiDiwjJVAZ6j41/OnFDLm3acQsEpkECJgE
	W2sNmAUu7nLlpvJDtFgaSC3v047Gef8tnLCz8FKI8ZRM5RsLaSeMXWLtI5yV6dzks1vbDLqklRybg
	xfPT9lQzRbuEwaVs/Q4nQzAUp3aV0r10tMrdlexOruOyM2EaZ2uZlRbR6hy6rSH7uRcUtSZPvIS25
	UCDyY+07UfzTJeLg+d5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnsKK-00FsuS-1A;
	Wed, 04 Oct 2023 03:13:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnsKG-00Fsrk-3B
	for linux-i3c@lists.infradead.org;
	Wed, 04 Oct 2023 03:13:30 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 1C94A2009E; Wed,  4 Oct 2023 11:13:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696389203;
	bh=ny0tqbgMnonpXUjor//ALDMSkh1FdO54mddDOeMRe10=;
	h=From:To:Cc:Subject:Date;
	b=L56utQZZTWzVoOwGF4aENga3q85J7njOlCpyhvmMsSyH+Ev5DWpzX3D2G4tSoFBDs
	 n6dPm3+1e4y75U+jubsIzH0IJrBUi2JgufZjFonDtG+cBIA8tFJfj9pJnuZXgcXOG5
	 zsMEXUUg3WBFI/CE1D8GtTRjHXMseWS2JGgB0oun5QizHmkOBNGSOci2pefBD05/z+
	 /WQien5wf2uCb3PPBvXKE/KDKcEDH3/uIQcU9+aIBtjHfvXiLmrblOo/XqOrAcAsuE
	 ws+OyF88shIUoA7Wz81+qVBgE5hpi6i+8e2WIyC9/hDfju0lLwywaNlGHO1RegAdgJ
	 LZOGyFyx89Sdw==
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
Subject: [PATCH net-next v4 0/3] I3C MCTP net driver
Date: Wed,  4 Oct 2023 11:13:13 +0800
Message-Id: <20231004031316.725107-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_201329_259209_2CBEB35B 
X-CRM114-Status: GOOD (  11.53  )
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
 drivers/net/mctp/mctp-i3c.c                   | 761 ++++++++++++++++++
 include/linux/i3c/master.h                    |  11 +
 6 files changed, 823 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
