Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC58606A323
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Nov 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FqawLTCS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+n11Z0OmZrJI2hYM0/8zUONk71CkOVHeBRm0r5fZs7c=; b=FqawLTCS1SSgvxeivmm+RkqO2Y
	0sL7Ih60ntEB+4+q6IBTdxbnpGSJ0KgiZcBlXhI6a3AcUxk4DCNTXiR9YBbExgjtn8ypHPVRo+DHh
	9qPl9PNEvGsUmvMOlHm6yJXhoyYluiNl1gukecf8bD4jgo0wTcb6ONS71ZdCustxLj8i83exANK8O
	u7WfPgYPla44K2BYW+wDC1nuZg6TfLMF1f9q7QNyw2LRi76Ht8AYsiojiJG+6fnpmXuB9qfO21INY
	RKyRovpOLS4Sl/rtJOtSGVpM25CxtvIhiAmphJB32OBZzzbfwAEPhicTfdwsF6Kkg/c6R+BxPCIF0
	Ycmiysog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzD7-0000000Ftx5-1FqP;
	Sun, 08 Nov 2026 09:29:13 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzD3-0000000FtuJ-2imR
	for linux-i3c@lists.infradead.org;
	Sun, 08 Nov 2026 09:29:12 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3zrPgQPBqx6OYAA--.31341S2;
	Sun, 08 Nov 2026 17:29:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>,
 linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: Re: [PATCH] i3c: master: Fix of_node reference leak in i3c_master_register()
Date: Sun, 08 Nov 2026 09:28:40 +0000
Message-ID: <20261108092840.314160-1-vulab@iscas.ac.cn>
In-Reply-To: <aqr19zvkGvMqRi2B@lizhi-Precision-Tower-5810>
References: <20260916160358.2081087-1-vulab@iscas.ac.cn>
 <20260916161616.7B6B31F000FF@smtp.kernel.org>
 <aqr19zvkGvMqRi2B@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3zrPgQPBqx6OYAA--.31341S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF45Aw4kuryUXF1kZFW7XFb_yoWDtrcE9F
	W2kr97Jw18Jw40kFsxKF43K3ZxGr4qgry7CrZ7WF1S93s5XFs8WrWvqr15Gry7XrWSy34q
	gr1DK3y093429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7VU1pnQUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAFA2rv4qiU8AAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_012910_080100_2936AC15 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Sorry for the very late reply.

Thank you for catching both problems. You are right, and I am sorry for
getting the API wrong in v1: the reference on the node is taken with
fwnode_handle_get(), so it has to be dropped with fwnode_handle_put().
of_node_put() only operates on Open Firmware nodes and is a no-op on ACPI
and software node systems, so the leak remained there.

On your second question: every other error branch in this function runs
after device_initialize(), and all of them end up at err_put_dev, where
put_device() calls i3c_masterdev_release() and that function drops the
fwnode with fwnode_handle_put(dev->fwnode). The i3c_master_rpm_get()
failure is the only path that returns before the device is initialized;
put_device() cannot be used there, so the reference has to be dropped
explicitly.

A v2 that calls fwnode_handle_put(dev_fwnode(&master->dev)), rebased on
current mainline, follows in a separate mail. I also dropped Cc: stable
there, since this only leaks on a registration failure path.

Thanks,
Wentao


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
