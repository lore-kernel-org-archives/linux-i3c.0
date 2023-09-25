Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1B9CE79A4
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwdkLPyrTumdtj6UAv7L4Iguc6oSw8VjsxUAUUl0c5o=; b=fWf8o0Det23EeN
	l2UAEJdTCnKS3G9JSrUmqtFh2B3MptYRYxN38CwjoIY1g9ge0+Qlyvk0tQOHj6adAuFVkB7Gixc3R
	6Cq5tV1DKRRcO4rpcYTTz1QF1C/WcrSvmd56aGwz/xk63O5bReDt1FGQBnRWalIoWPDHrotryI4oT
	BhQspsDVnM3UlNEXbucL/UNaF5HuuNUoeNneXz4cPrHlGG9eKKjcd9+4VdBnitlRJjrqc0MAc3pgY
	oA5+JnAUOjUHejortiw9LWhbm1SzYFkix/KGm36NAW3GADf2xNz/KSYAwbE2KATSzhgefBCbW8l1/
	BGrVmRZwMQK/IvyFi3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktj8-00F776-15;
	Mon, 25 Sep 2023 22:06:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktj5-00F767-0l
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 22:06:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEC76240002;
	Mon, 25 Sep 2023 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695679600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzCw6ra0zn/1by6znFNr5xFHVbxNOnnCrhXAzuwYZP4=;
	b=XudPymtt8i93KyLNlWn6HvF103CntmQ3dSUDVMG8Nt99hvWn5t8nl8BYV2LfrzJkIa25qJ
	UeWuBcD5J3DyxXM/+AxO1ni+5kAjauSMuh5q6JovqokH6SriRtRvQNHisnFHJD04gmbQWK
	j8elGrMuV/A10VG6ztBF2HoEDWwPpW8aBFZEVTrEqu8LVOhamfbSHpFs46H4catXNjGgCC
	6XemR1oPJ+KHCNOqGqB42iSrMNPJ/Yxr8ZKZSeVU5eRWmUves+KxYavenY5K077U/eJukK
	m0EZYBCp2aCJwpUgLfMUgz5N9tAEOEoK6X9StmWLItYaNSkxgVBSD07qkiuZOg==
Date: Tue, 26 Sep 2023 00:06:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Fix potential refcount leak in
 i3c_master_register_new_i3c_devs
Message-ID: <169567834167.244864.5680434544553157892.b4-ty@bootlin.com>
References: <20230921082410.25548-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921082410.25548-1-dinghao.liu@zju.edu.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_150647_563442_8DA4EB45 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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


On Thu, 21 Sep 2023 16:24:10 +0800, Dinghao Liu wrote:
> put_device() needs to be called on failure of device_register()
> to give up the reference initialized in it to avoid refcount leak.
> 
> 

Applied, thanks!

[1/1] i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs
      commit: cab63f64887616e3c4e31cfd8103320be6ebc8d3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
