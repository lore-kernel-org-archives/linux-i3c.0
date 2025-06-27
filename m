Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391FC7EE2A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nO9i6zZDk0Tj2gfgavXf1CkWJe8F04Z0HMDNEIX3+74=; b=OGGmkVd6sSQw7U
	cnmHL5S5SpPM1/1SB3g/pWHUyDk8MrA5OlfvgRuIYDmgudXZS8KVlluuDTOsAEAy0CuIXplwNunm5
	n8vxN1r5ZKSFZZ3yLn3/lvT5XFZ9DNac5dtXvozeb2R2+0u2Vop8830OUEZnAItDgXBCDt1KBbtlP
	mdZyJCVKyQi0xg9fRVsE0acd9zsfcuEC9erDIznUM6kgBOuQlI1lYohGAU+HI2qGUpop1s/c3cU4f
	YfeERU5gAvVglAfdf06ecJLXkWqjqKVtbm/C+ixmhQ8f4m2TwzQO1C5aEesGgjXsPnBYXEI484/S5
	IVVrkqW7dwSdeJSWjwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV348-0000000DlHB-2sV1;
	Fri, 27 Jun 2025 07:00:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV31B-0000000Dkjy-3XBy
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 06:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CF52443E1;
	Fri, 27 Jun 2025 06:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C8FC4CEE3;
	Fri, 27 Jun 2025 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007420;
	bh=RUJsjmSGQPxvlILjO7Cg04n19x/+TREx8d9eLpvfC+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfxPO0xFDf8iwX3L/LLjc4NqWbApFKokjGOYNiMubo9FKIcNmC6O57xiZqOXFIpOn
	 44ZoqG769urqZ7N0S8Q7zN9XdDK+f4nbkxaRMwH3VX0/r2VdI4qBRrIfvtriLnwYBu
	 40n3Wfind6dDtwrZVQSXWZIE07lPRnbWglF6SGpmSmwiecfa/gu7inEKurwDX8lD6g
	 ihhJnrbD1l3urWdr4JMN1T88Tt8t+Ga5ff6AcFifAam6a7ze303Mg6LEu3+bDtaVOy
	 GFzo9jYJCvrxVV1RtNJ8yObHwceUaSBIPCngFi+6sVIwJ9nUzyDTwhzZmcyosyvs7H
	 RKFMlp7Pahwuw==
Date: Fri, 27 Jun 2025 08:56:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gastmaier@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235701_900269_C464367F 
X-CRM114-Status: UNSURE (   6.78  )
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

On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.

How did you resolve my last comment? I don't see any explanation -
neither here nor in the binding description. Binding description is
actually better place, I think now.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
