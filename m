Return-Path: <SRS0=Jt+Q=SP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7929CC10F11
	for <linux-i3c@archiver.kernel.org>; Sat, 13 Apr 2019 15:19:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402C320645
	for <linux-i3c@archiver.kernel.org>; Sat, 13 Apr 2019 15:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ci5oqB9a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMnkEhPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402C320645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+hlvDfKy5CEDxA+ZTK8Zbx6hxyE/VjlRcZa2lnIuUj0=; b=ci5oqB9aCqaYt948v4m1JgCws8
	MhujSHPPBXmdUB1HpY6klK97Bn0ABJoTuOuai5VCye0y8BlkUTrgbVfgSVXPda0B4eDh1oYLn8Dj/
	/4GxpG18Ifj8sc87fJRw4/B6JcfthKHGFA4UzGKipcZ6chmieHelaUfUtVWFqvZOXqedv/BkCeri6
	XrmpcJsE67RydN2g4re5Suf49N0x13ZC+2wL1vgWLTH2FlrUycCmlg1vbUuv8qr44L0ZYtr1tIYkS
	VdKI0LKAr4MRz0/JCznrcqKJbLzKUlqlzZROvbBYzKRoI0CE5J61YOjtLZA70S8CI1kZeXexfYvmZ
	JPYiN0zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKQz-0001DJ-QT; Sat, 13 Apr 2019 15:19:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDZxN-0007pw-1C
 for linux-i3c@lists.infradead.org; Mon, 08 Apr 2019 19:29:26 +0000
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA6642083E;
 Mon,  8 Apr 2019 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554751764;
 bh=AxUCHFwjzar7GVdVPwNCy30CQAjS4n4Zsgage+PkFcg=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=vMnkEhPZKPwX7X4QOLXt25+AOBvzTGDekwRpGhbOiSeHlUbuTkoGNUssV/jn3d3mu
 mweMjGJA/qCWv/838L0/9W/NlOXdzc4xrmIvxfEiDjzmfCp3ViBLCPg2BJ/Oyql1Yz
 JAo6kB2K3c/kcJWJXxLNT6n3Ef9ZsmLQZfJbDCSY=
Date: Mon, 08 Apr 2019 19:29:23 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2] i3c: dw: Fix dw_i3c_master_disable controller by using
 correct mask
In-Reply-To: <72bc802eb51555b8cf33595a87e06940e367777c.1554721267.git.vitor.soares@synopsys.com>
References: <72bc802eb51555b8cf33595a87e06940e367777c.1554721267.git.vitor.soares@synopsys.com>
Message-Id: <20190408192923.EA6642083E@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_122925_092492_4D619466 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 13 Apr 2019 08:19:12 -0700
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
Cc: , joao.pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.0.7, v4.19.34, v4.14.111, v4.9.168, v4.4.178, v3.18.138.

v5.0.7: Build OK!
v4.19.34: Failed to apply! Possible dependencies:
    1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
    603f2bee2c54 ("i3c: master: Add driver for Cadence IP")

v4.14.111: Failed to apply! Possible dependencies:
    1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
    603f2bee2c54 ("i3c: master: Add driver for Cadence IP")

v4.9.168: Failed to apply! Possible dependencies:
    1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
    603f2bee2c54 ("i3c: master: Add driver for Cadence IP")

v4.4.178: Failed to apply! Possible dependencies:
    1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
    603f2bee2c54 ("i3c: master: Add driver for Cadence IP")

v3.18.138: Failed to apply! Possible dependencies:
    1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
    603f2bee2c54 ("i3c: master: Add driver for Cadence IP")


How should we proceed with this patch?

--
Thanks,
Sasha

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
