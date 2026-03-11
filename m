Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBA103E2E6
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4w2saf8tamQYOuRcgWjYsWsbyOe7LKDl1LvXn+x9+0A=; b=IYZ6NsoS9tA+3H
	Ae4dCYJ13evAHkgzHJZ6x20L9NXwhL4QVOR3ISLS15cKerBOwkjqCsc/MCuGnrXJSaoykwUI0438l
	pigl3GmzYnBYTw9Rs6lao2NFt1aSS5vSWNVNRYCEL0s13dRbPwyxpnQ5t9daF0ZZWbMKN6LgeXTHu
	iiEX4YQ/9jhYT7/aQ15QAGmztNuxFvuJOHmHLXMZrfh69RJdqDsA7eiA1rNJY4ceNpBz3qpOPjIKf
	tCeJOclJMt3JyKC3UFhPK8qJximpFwwLpuUU8KKGNEA28woO+YKZNq1SZ42vbk0U193vgrPlpzLXi
	QvCqjORVd8fLeXe9m2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rhi-0000000Ccjb-18bb;
	Wed, 11 Mar 2026 22:06:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rhg-0000000Ccii-09xd
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 22:06:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31D0DC41590;
	Wed, 11 Mar 2026 22:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDD7460004;
	Wed, 11 Mar 2026 22:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13B7710369BAF;
	Wed, 11 Mar 2026 23:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773266812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xjQAI/yVTxsA4xoqZg6BVx7opdpl+Bq1gt3iZR+Di3s=;
	b=UcpJFh0dWbdGPvPyqYruoEfOzKoVgwD0u9DkDBnQSUd34kgTP2SZsCSiMztDeiQ6KVQM7q
	sEK5mqB9n3KQeaTD2Di3iCqNbe+yHoAbAgqfOSqHg7LkUBnOCZwC2il5HCSd9EO7jQlZkn
	DG7iXj0EYZLmKFn1rjI5GjOFg7QJxWcgDUxr9v14Hh9pv/lWYgqNagixleGmt8zztBl9xy
	0KQHdwXU7yFxpX/kXxQIfGreqDJRTp8X+aOeUWfOeq2Wn4RlDe+2fEYEiIXhu8eBsy1IlS
	rNg4E5qCZer1/dpKeOvus45sGcPird++weY0oCy6aV6TizBib/Pti/e3qFTIPw==
Date: Wed, 11 Mar 2026 23:06:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-H
 I3C
Message-ID: <177326679640.2393443.10091046244577687192.b4-ty@bootlin.com>
References: <20260309075045.52344-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309075045.52344-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_150656_289134_6F60A801 
X-CRM114-Status: UNSURE (   5.82  )
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

On Mon, 09 Mar 2026 09:50:45 +0200, Adrian Hunter wrote:
> Add I3C controller PCI IDs for Intel Nova Lake-H.
> 
> 

Applied, thanks!

[1/1] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-H I3C
      https://git.kernel.org/i3c/c/3ca992dd980f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
