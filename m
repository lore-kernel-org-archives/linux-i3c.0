Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852C5CDB465
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBt99afO6F18hAMLGjxKtfTsIQlK/ei0XEOKYBL34j4=; b=N4mL+kU0DdFuHH
	gsXMeWQ3lJ7Lp2K9eym4Tf4qDtfjgNzmGGRww0ztoi3aTu4u9g99/LYx0fpQ6x2VN0diU5n+nhfmb
	BbcJXTgX85giI7JxCuckWwq814XbZaZxFQeCKXUAhV9gCY8H65+yP/LaK0BKcGrQEJmEI+Y8NcSGq
	esdah8deaetBiRxWkPmSwU35yYqLBl5t6QXYzq6EH/vNhTw9VjGaoUJOeABhnxHG0pJ0fbH24mew8
	2dwtB9mNf48ejsZ2yY1MTYkF27cln5oCOwweAdqm+0Jc1GfHvaH0gTxQ1YMr9JPmZ14jHwlpIbV8c
	m1k+1MwYsParlU78sb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV71-000DZd-2m;
	Thu, 19 Oct 2023 15:39:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV6z-000DYn-21
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 15:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 976B8B82753;
	Thu, 19 Oct 2023 15:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907D1C433CA;
	Thu, 19 Oct 2023 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697729939;
	bh=AREkZrmSccQRuZ4xGIzEq28d+dMWO3ytqI01nPqGsxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYBi5Ia4cNzwlQhZHuxcog/XnJeh+GxvXj3dDk7kRzJ545iYDy0kSx0QGHXiUuz9f
	 8M7ojGLcm1HjqBDTsaffw3GAYXKBaczOF1RGbSjqGMgks59s9Nj4Wx1jdRPMtdDFpR
	 DdSO0z4pBuRnNKlSMUjDKY22rosC2Cj5KT1NJ3QA=
Date: Thu, 19 Oct 2023 17:38:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	miquel.raynal@bootlin.com
Subject: Re: [PATCH 1/1] tty: i3c: add tty over i3c master support
Message-ID: <2023101906-rimmed-unmarked-0ba2@gregkh>
References: <20231018211111.3437929-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018211111.3437929-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083901_839384_F97A31E6 
X-CRM114-Status: UNSURE (   6.45  )
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

On Wed, Oct 18, 2023 at 05:11:09PM -0400, Frank Li wrote:
> Add new driver to allow tty over i3c master.

As Jiri said, you need a lot more description here before we can even
start to review it.

Please fix up and send a v2.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
