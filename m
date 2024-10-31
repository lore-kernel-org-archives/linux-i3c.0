Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA737E6748C
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbIchIgYGjgdkKpQhVIsVFGNJYyENf6vDxRjTy9uV10=; b=fRWglRJ7V2Mosq
	EjxyjFj7R+yi36X3axHZL48i+S1StDMiW2JbhTkW31ZDVxgcTd+QQw0eN43nBPGWpgW5bDgDA06Bi
	wmAe9tZ+jcQuC8jV5PbzI/qHfDh6T1tDeqxMWJ2qexvo75TF5nbQtRWT/L+G2SmLZBCWPCt6nk7rF
	3ffLy1kce4fHxNbdZdH51UwYMgc987NRGD1gxk8SOUZVSGqjd6UMKBGxFIIlkPdMwCPoWbtC9ZUIu
	XqGvGi+8mbSZbofy+uIanH1XZSIFRqZ3DlcuuOWBW1LgeaXreDhe71yUekUl0C8dOQX7aPmcwpIb8
	4a+VxEYHkBYqljlLNLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eH2-000000058dx-2Cza;
	Thu, 31 Oct 2024 23:08:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eGw-000000058cy-3e2I
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 23:08:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D0DFF805;
	Thu, 31 Oct 2024 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730416087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BCFCPF4B9iVyD6O/ctAFxNBJbZPeroNHpthZdwOLDHY=;
	b=o6vpm5XM39lgmLP0/LUBc9WNNaxujk1B/0UFCHbscX4SgVtnMh1M2qpD/Gwhm22uLhZCEB
	drjtWvLkCGa1tJyJbViIeFZ/D5+q80Oqqm/eTCADf6cu3jstSazdp+zT7tF8yOyAsp2Ekv
	wbyoRae6ykCOibGJKBXjdyccPfUibNDOhN5YqTn32gq/X7RrZzDY1uvY3wN8pMwI5Up0VX
	WCms41Slg4m5UKsIbzllv4K4nKow8EL/tRVvpm4suu7pW2mJuN/KRVvXoFR5aiiN8vwSWU
	f9Psk3iCdncT2xMCcw3L5SLpyW9OqCMuaFFsHJIWV85G2wMrOkKJIfANhh36dw==
Date: Fri, 1 Nov 2024 00:08:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	xiaoning.wang@nxp.com, jun.li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v2] i3c: master: svc: Fix pm_runtime_set_suspended() with
 runtime pm enabled
Message-ID: <173041607944.2393443.4629872901848219813.b4-ty@bootlin.com>
References: <20240930091913.2545510-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930091913.2545510-1-ruanjinjie@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_160813_253943_48D26947 
X-CRM114-Status: UNSURE (   7.07  )
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

On Mon, 30 Sep 2024 17:19:13 +0800, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Fix pm_runtime_set_suspended() with runtime pm enabled
      https://git.kernel.org/abelloni/c/18599e93e4e8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
