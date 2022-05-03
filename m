Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6910C433EF
	for <linux-i3c@archiver.kernel.org>; Tue,  3 May 2022 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tr7FDSr4tdWoFHm3zlIQetMU6+FZVqps5QYT4le/S+4=; b=d03fo+77vSCQ9R
	OpcqudBcbx2yIBfUQkZRmjCGG2j7Ogn8GN2yUvguKPwVb7TJPWpjVcFyxQgrLbIuLs51JGsz3yj2P
	cTSpA6Uvz8srkRITx/ZSvC3mTbzwEtgrm7pgy4+kP2RDyypwiuI4F8NTN4g4avj6Jf7C190ST1wjJ
	1QyjDb05eFOPpkG97SZvD6EVuLMx9ph8C57dRN0YBAlPUFKpHBHO4F05CJtxgtemZ8NtiwEcmEqYY
	Sk8yixttykEbevzor+Q/Hckl2S/Ea9amlPuAy+ipNuEs7+Oy632uJrpz+2RDpb4HlEvv5ITHaL32j
	7fxYpdzxOKyvdIhssgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0DR-007oah-Qb; Tue, 03 May 2022 21:37:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0DO-007oYU-Ht
 for linux-i3c@lists.infradead.org; Tue, 03 May 2022 21:37:52 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FF01FF808;
 Tue,  3 May 2022 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651613865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhV8JO6n5kXC88f/zTARxclvqaIyYVSq6FOpYLYky8o=;
 b=fbn7gJBRVgchh9RqK1mewr0qO2yK6P867EdZyCSrdIZiV8mMMvTdtjngyUPyNlzURJeZnv
 nUwE1yBWioW8C/kyMI8BN8rTCUikQnhZmL/2x8PZpJoKdPuz2rQJUKAJjXSp2CbsfmJOrf
 kb1KzbAe0nPesUPmJe3sgFoAhpcPosez/5Ep5uueO8Kfd6+OvAuXTzTUsFR1DAu03wZsLn
 zyQHC0RtB3wtaeWcAaUinKR/o/70h0xBFFiY+8W5HlzqwWXUmzltEDXiS0OwsWrckH409K
 /qoCFLUNN47Y4h0KpGmhDexWn+GQ/6QVpDuNK87gWVoz/3By3iK5DyedsuzN4w==
From: alexandre.belloni@bootlin.com
To: Vitor Soares <vitor.soares@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i3c: Convert snps, dw-i3c-master to DT schema
Date: Tue,  3 May 2022 23:37:43 +0200
Message-Id: <165161385391.974772.7995938945274050743.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422192236.2594577-1-robh@kernel.org>
References: <20220422192236.2594577-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_143750_751341_B0C0EAB1 
X-CRM114-Status: UNSURE (   5.34  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

On Fri, 22 Apr 2022 14:22:36 -0500, Rob Herring wrote:
> Convert the Synopsys Designware I3C master to DT schema format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: i3c: Convert snps,dw-i3c-master to DT schema
      commit: 6742ca620bd929ee96bd6724692132056203fb95

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
