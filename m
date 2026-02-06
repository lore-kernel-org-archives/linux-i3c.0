Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBCEE20B9
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjLgnuTh6bb7se48I97WTjRYC6vCz7gjw3xihewWsD0=; b=qKkVSQXhJi57jT
	THHQythepSSBsmcwi8pKhCIRelB8TxSgJMp105Mlp7dSEGLIya7pgaYHuNJgqVj2R9YrZnaOTz8x1
	+MceUGscoKEr+zErOQOa6xZmXFNvmlEKdLuBkuXM/38VklZHMZ7+JwnpTsRIXZqjrtoyCbnSh3BKe
	9vRlp0vhJQOFQajChGKbhryBD30Wwjr1HK33NSGDPygeOnK2tXOvzi72f6OrBN/BCPnc28VBJKlvg
	8gr3e1A7FGWw8Olk2ibS3gq8UWnpsiP6Ougy9K84hRNWNBBsqv5m/27O7kYANyUb4RIu8/2CyaDZh
	r9opjoEyFfgsGoR5yupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPI5-0000000BbIT-1biK;
	Fri, 06 Feb 2026 17:06:45 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPI3-0000000BbI8-0aNx
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 17:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPB30uif6ZjbaWoKNMsijRArOuBtqv7u83T5CfYaVKoj66aHtn/Kgn9IE1ITkjT249Z1IFI7jDAAbZHF6vdlH52dNEVZte74PIR+ap+Dql7T0JBUSEJSaM6ppRYNO6gOURGmM27+VkJTJu3ue8FA5Pu02BFBDtWHzdwr8pLxprbrwxPgvd53e90tk4J8uQDJXPgS3jOighF4ZL858KbXVAqh76Bf+D/EsFPMoCnCLQBv61muputLUAMu2LtMm+y+to9woQPqaJSrRybAwWEGt0bE8dW8UgXxo4SwRNHV4XXC5qdXocIa6dtLIoLoDjJqNMSZwSAZ0FB4/9THCxRrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dtJpBpaJj/eQbsN8iHnp1hkp5NLcNb0UGi2fEoGzlM=;
 b=FfPQMik2DEKXDRP7zn6aH0vF5ghsVJPDHYwOlL1SskbnF9HziKpNSukUo1n9nkudlTm7icc0SSxxb79Nrht5naLhUsFzBUggDwlX7BnKrX3rQai8BXEQNbjpK5/ishYC0IPMb7moyWnNsj2lQYxif5gQw1nPyzHZL6kUgswZIzDkn00SYxhiz/dU+AikFfhyEP8oZumjizJ0G33FG1syLL0zfhwS5jI44wzFx40oGrfsHRMcXsIsW1fIoL1v7cPDfYnuJm4lmJERSja7lBz3H8lobCWIpWsMgn/s6K8meVfijlTHdahBmHX0x3uYppQTlHq59jUqxIZtKsb6slnPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dtJpBpaJj/eQbsN8iHnp1hkp5NLcNb0UGi2fEoGzlM=;
 b=OaASM9EbKZSG9rRTRq+JU1k4HvG0v2jFf28gp2+M+fCXJb7MngpzilB/6MKRPxRIuF/kMyPC+72fhECxoXsOdJoVXBTW5v4ok0PcGXmTJnNRGWoEbcOyB5wHU3Zc3094OWaiku2+4u11FtxXVObKFEqAkMSy70Pe313ZjBXHVrv3BntrXV8Jrbh3FVbHirgE0FOgq2ELxZmBhNzzM330cVwOlDLMQPA4LL03TL5oZhGt9bIBzuNWvG3OTd1pJhHjqAajim6S1ZHjddb8svhM8dyn5KNxIgiZdwCQFdo1XVYk7PTV4VZtXBx3ip5y1eUS45hS/jzGNg3+hz8kZLwMFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 17:06:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 17:06:38 +0000
Date: Fri, 6 Feb 2026 12:06:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v5 1/5] i3c: master: Expose the APIs to support I3C hub
Message-ID: <aYYflbET_ZE1QPDT@lizhi-Precision-Tower-5810>
References: <20260206120121.856471-1-aman.kumarpandey@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-1-aman.kumarpandey@nxp.com>
X-ClientProxiedBy: PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5436e4-68c2-4e60-0a63-08de65a216ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UJB+s+8LmvAJ8lZK6JA8CMvqYp96sk7mmHlPAjkzjDZmuE45Kr3c2Tc9HvOa?=
 =?us-ascii?Q?8UGMCphS5W+W4PZJir54qbPibTtjUo2LvyapNxzPaQcXH7E3HGWCk/70izTU?=
 =?us-ascii?Q?KLIVunQvV5Lr2OT7kpmwVmoSLh5vUbOj2Uj6aZ1kgYxH3nyEbMWbNJNtT8uG?=
 =?us-ascii?Q?lsp8Xy8hlgDQ1oSAFZM+D1zo1JR52/fZeO2h4fLQM3B2QDYyB2yTRvxiJt9n?=
 =?us-ascii?Q?k3oA/vjxCRE7CWBSl8b0TSm6pL6jcmmOvQdzbh4twDvFotX+3BvV57ARfUjg?=
 =?us-ascii?Q?5JKn24ZqeMscmwM7/jbY64Rd1kFVuqWbpy2g2nXA0/1hpgfciP/5fNW50kEV?=
 =?us-ascii?Q?b5TVpV9Fc+j8/v7dLloSLX59mK73OaWHAICzDOM5qr0jIAfluZKttEM3vn6k?=
 =?us-ascii?Q?SNadC7PTTHuH3xYWCuJB4kwuGgn0XIvn6l1KoFwfqfJCQQtq2ov4j7kJfdnj?=
 =?us-ascii?Q?8pywiGCbWtwuGqg9fUb7O8oJ8Fl5WdaWuxroyaI1JKKeEPbypP9fKRnwvscn?=
 =?us-ascii?Q?nbU7tabkFcjDrXLfZoNvRS/kF3P3RcF87JJfTEennv5qWrIHjbVHRt9wSvbL?=
 =?us-ascii?Q?POenzW6GONrb05lvQdAle5hFMPjX7bdm1PwDB/WJDkE6reaFZW39K5yAls4s?=
 =?us-ascii?Q?5QxhR5vh+QJpKFiTuJCArQv1LjUBOLwyKOyEnzsCHUCjJiC5BKhzY6bJdcHf?=
 =?us-ascii?Q?iR7LOipBvoUv/sgPkQPKKwyHDWL+tj7DJ7Sosx9JIIkmfZGxPUpbbahyOxQX?=
 =?us-ascii?Q?paGprpyYDK3FROnpeCuxiyerOGiL5VKGmiLvb6FY1c/lkxcSXgZN0TbIj+CH?=
 =?us-ascii?Q?gjn9hzSBk/NVy8/BK0XEvUt0mMGfxjv0uRo3wCxFXmmtjRUg6nuHfhGftuZz?=
 =?us-ascii?Q?PgfAvc4jXU9J23yUh0p/zOxfjYrcdMpNmJIUCNikp+oAp9ZF6nZk1MtmDQ/O?=
 =?us-ascii?Q?NVgng9c18EHecpSuyAFv7R4Oo7vhwHP/5yLMV9Xw3T/qEf/wqmfLuzy4LboM?=
 =?us-ascii?Q?49C1mC7R1skiYblAxphsDMLbn2H6vA8T6Bxe8hj5T/iujBiVzp1fW4zFyxxd?=
 =?us-ascii?Q?MJtABxuD1saOmRn0QdpWibvdE5GSPpYNvSqMgB2JPUlGG0KU24Enu7OauDIA?=
 =?us-ascii?Q?JWxBnb9LRGQ/aoBL5l/tKO2rFaU7CWbrrWQz3BbRf8DSs9YkjIV++4BDMRX6?=
 =?us-ascii?Q?Up4n16c0L4APxnlJ6uqV25AU2QQZkf6bn7Y+uKPG19HtFXts6vAH7tnFoG/e?=
 =?us-ascii?Q?PJWgNbP7b7WKKrtB0RJ5/ZG4BfbF+udDpaDViU7gRd9pf8zlMc181RuY2C+s?=
 =?us-ascii?Q?QlH9J2+DU6VoJkXFikBBV3uP7eahsTO44eN3R1fWo//bKaCc8pc35ALWj9nu?=
 =?us-ascii?Q?l8BN0RBND3H0gyQwFeO1xLnzoD5h6uUMfxMQTnfatp6Kw7l3lW2sJWVkyBhx?=
 =?us-ascii?Q?KNMO0ipfSomFz4dCHr1LwmqkJk54KwGwvlPRJkOE9KLJDdceS7TLH/pYdvX6?=
 =?us-ascii?Q?pW1c+6CmDx8YRXWZcVzji273Y0G/Ihoa+SYzoHDIhrxBPNm7qJybDW5Zt5bl?=
 =?us-ascii?Q?pLzwH3WU/ys+NT7rTJJH84nYUXvKD8Bgc+VanmTxzrbBD7TXs4BbuU5UQwTW?=
 =?us-ascii?Q?JRjy5LoIArxORZlmJ3s3yus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R/uFLyG7TjlrRjgBMRUvCqY7AnKX/fbZPeEX2piZx7VCFgRqdnVzSQ9926Q3?=
 =?us-ascii?Q?D5z940A55F9tUsIli+gPxdhiFc7Ib9PH7Xsemf8qW8Q0AvQHJ8QIR0qw5DfF?=
 =?us-ascii?Q?Zm2GA//sMw8vYRNdgZe4mWJ4mmOoQ/5c5XyljkcSDataPcDxXk9e6l3Mz/vW?=
 =?us-ascii?Q?1w9ENSOS/gOB0BMuyRIiQcdgZaaHMMvUfaB1I34iwXL9uOd2WkfCTxAV1qJC?=
 =?us-ascii?Q?dTWi/3ytoN+z3IHREGtRu7RLWFCtnlbnfb0/N/1I/gShu0IHBxDKqnCJTStZ?=
 =?us-ascii?Q?CIHMzIKhCkU70LNC38dbN2TlxFRniuNEFJXfKhv8q99geCTHuaiMqbOUOBw8?=
 =?us-ascii?Q?+Im9/jzL28w0Y8Z2NxaUafjD9hWFyX173nkGMWdvsuIckxCmNMn/QjPTZHrY?=
 =?us-ascii?Q?UuFVMFkkhMd0mjWI78VIex+HKnBX569wEp0S7+rsdkei1DmIiqi0rX4TELtS?=
 =?us-ascii?Q?S0aqhuJibwxkT5HSlh8PUOGDUXlRKpsQGcaL68ev3ZgnMrLK35faeHPZFo9+?=
 =?us-ascii?Q?tMIRwwckaVJVPMscq6lAL69sOsBQTi2vxBxlWzhzMp4XOMB2LXn97FVjvvZN?=
 =?us-ascii?Q?53XAaZdn5nhBCEh+ACmfbhmWYiEVGG33QwV6i/EKW31E0c66WK4vEE90G7Go?=
 =?us-ascii?Q?fnO/EOZAeM86P5d7+dHYWh2O/x4Uh9YxCyqCNtGRvdNoCbLFiqW/j+QVPXd4?=
 =?us-ascii?Q?SJaQeyQEddYPfcEu2tESnbb4Mca7I42qLCQGQWE+xgNdxvL3m0e1LWzdFg0W?=
 =?us-ascii?Q?wbkdxqAwkjzQazRDYyglTWxBgRlgQ15m5v9+f1BweUNsrslz5/M8KhI9sWEr?=
 =?us-ascii?Q?bTWu6EUBD28Dd7kNLmhY9V6TIgJGasspo5jzPQUxaehbDr+dMC+sdFar8k6v?=
 =?us-ascii?Q?vK6gAHeQ9cNQ7hZwOgIvF73OAFFWfOEuqxjbNzX8J2ojZnYi78Pz5FLJrUxX?=
 =?us-ascii?Q?XvfU9TKPZkzYUkPPGBlnSaCucBTEIgal9vwC1dqZKW4hfGGmRQOhAulGTZ2I?=
 =?us-ascii?Q?XoohV4DqB3fF8laXKFKh2V6EtEDiZDokwalliSRb82o4cUg9HgMxn/cWQwvL?=
 =?us-ascii?Q?mLcxLDy/BUImEcST3csvxEFPWAq3nJUmCEqfdaYPK+a9odZ7FolZnfcZdgvg?=
 =?us-ascii?Q?GY610bWC806Za1i34wmhIJ71XCnKRnFZSNQaMn29sPaoY0wkZ9ZoIXugFoFq?=
 =?us-ascii?Q?qgVL07yRVN3HfImHV8BhF2c/KY//zTubwshnvkk7oFk7WheGe+C36PSw2Fwb?=
 =?us-ascii?Q?0whxYNBmxXM1hqN+wqmaHSFe0nNPQ4x8RYZ6/o7LS1DHDe4AGIIrhrQGwlK2?=
 =?us-ascii?Q?BCfPHCdlOU0Qoh9Ptc2NRXyAocdYUsu43GWFzVGLUNjaU2J/XIQM4HHGZggH?=
 =?us-ascii?Q?+PqPhLsZ6UgpaxG/GQx4T2UbKn91lwUGdvXpDPEv+3/E88/z+JWuK7szZaHf?=
 =?us-ascii?Q?tZEb/SOz+IbWC1I2sY/JwoSbYjZqp8XaC5XdwlCv1txD+rz292T0CByAxd7x?=
 =?us-ascii?Q?S0givkT8QUwXOi4BFWp/lTcerckHc9IOcFxaocq5JMid1SM8ekW445NKrzEq?=
 =?us-ascii?Q?DBdLyZ2StwpNJcuoZOFCFQ3hXvWdP4nfv+If+0rydtBMtQJdiRhM/G9mBLFS?=
 =?us-ascii?Q?pjUJXAfGOMPrBqBaE92uBZNSLe8AALMQ1jJZykF+IGfYx1UrNjiEhc9tiekB?=
 =?us-ascii?Q?avqeIQT77YFH9XF6tspMdguVaqcaCoMwDaVgNz8IyHSqwFTd0c3tiu8qe8/T?=
 =?us-ascii?Q?rjZQuaeD/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5436e4-68c2-4e60-0a63-08de65a216ef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:06:37.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQlgEH1/K6JWoLTBToa0YFrU4YZtESFBxV03+qFxsCVbhUa+GZzqaKmXV3Q8yR1pWyFQNFOAvs4YK4obRRE1vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_090643_364097_C67432C1 
X-CRM114-Status: GOOD (  35.58  )
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

On Fri, Feb 06, 2026 at 02:01:17PM +0200, Aman Kumar Pandey wrote:
> Expose i3c_master_send_ccc_cmd(), i3c_master_supports_ccc_cmd(),
> i3c_master_reattach_i3c_dev(), i3c_master_direct_attach_i3c_dev(),
> and i3c_master_direct_detach_i3c_dev() to support I3C hub.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> ---
> Changes in v5:
>  - No change
>
> Changes in v4:
>  - Updated I3C master to handle hub support
> ---
> ---
>  drivers/i3c/master.c       | 123 ++++++++++++++++++++++++++++++++++++-
>  include/linux/i3c/master.h |  11 ++++
>  2 files changed, 132 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..c92152ff795f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1544,8 +1544,76 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> -static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> -				       u8 old_dyn_addr)
> +/**
> + * i3c_master_direct_attach_i3c_dev() - attach an I3C device to a master
> + * @master: I3C master controller to attach the device to
> + * @dev: I3C device descriptor representing the device
> + *
> + * This function attaches an I3C device to its master controller once the
> + * device has a valid address on the bus. Devices without
> + * an assigned address are ignored. The master device itself is never
> + * attached through this bus.
> + *
> + * Return: 0 on success, or a negative error code if the attach operation
> + *         fails in the master controller driver.
> + */
> +int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
> +				     struct i3c_dev_desc *dev)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * We don't attach devices to the controller until they are
> +	 * addressable on the bus.
> +	 */
> +
> +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> +		return 0;

AI: - Silent success on invalid input is questionable - should this be -EINVAL?

> +
> +	/* Do not attach the master device itself. */
> +	if (master->this != dev && master->ops->attach_i3c_dev)
> +		ret = master->ops->attach_i3c_dev(dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev);
> +
> +/**
> + * i3c_master_direct_detach_i3c_dev - Detach an I3C device from its master
> + * @dev: I3C device descriptor to be detached
> + *
> + * This function detaches an I3C device from its master controller.
> + * It ensures that the master itself is not detached. If the device is not
> + * the master and the master controller provides a detach operation,
> + * the detach callback is invoked to perform the actual removal.
> + */
> +void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	/* Do not detach the master device itself. */
> +	if (master->this != dev && master->ops->detach_i3c_dev)
> +		master->ops->detach_i3c_dev(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev);

Can you create two patch,
- change existed static function to API.
- add new APIs.

Frank
> +
> +/**
> + * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
> + * @dev: I3C device descriptor to reattach
> + * @old_dyn_addr: previous dynamic address of the device
> + *
> + * This function reattaches an existing I3C device to the bus when its dynamic
> + * address has changed. It updates the bus address slot status accordingly:
> + * - Marks the new dynamic address as occupied by an I3C device.
> + * - Frees the old dynamic address slot if applicable.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 on success, or a negative error code if reattachment fails
> + *         (e.g. -EBUSY if the new address slot is not free).
> + */
> +int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				u8 old_dyn_addr)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
> @@ -1569,6 +1637,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
>
>  static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>  {
> @@ -1692,6 +1761,56 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  	}
>  }
>
> +/**
> + * i3c_master_supports_ccc_cmd() - check CCC command support
> + * @master: I3C master controller
> + * @cmd: CCC command to verify
> + *
> + * This function verifies whether the given I3C master controller supports
> + * the specified Common Command Code (CCC).
> + *
> + * Return: 0 if the CCC command is supported and executed successfully,
> + *         -EINVAL if arguments are invalid,
> + *         -EOPNOTSUPP if the master does not support CCC commands,
> + *         or another negative error code from the master's operation.
> + */
> +int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				const struct i3c_ccc_cmd *cmd)
> +{
> +	if (!cmd || !master)
> +		return -EINVAL;
> +
> +	if (!master->ops->supports_ccc_cmd)
> +		return -EOPNOTSUPP;
> +
> +	return master->ops->supports_ccc_cmd(master, cmd);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
> +
> +/**
> + * i3c_master_send_ccc_cmd() - send a CCC command
> + * @master: I3C master controller issuing the command
> + * @cmd: CCC command to be sent
> + *
> + * This function sends a Common Command Code (CCC) command to devices on the
> + * I3C bus. It acquires the bus maintenance lock, executes the command, and
> + * then releases the lock to ensure safe access to the bus.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> +			    struct i3c_ccc_cmd *cmd)
> +{
> +	int ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
> +
>  /**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 58d01ed4cce7..b059da7777d7 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -602,6 +602,17 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
>  DEFINE_FREE(i3c_master_dma_unmap_single, void *,
>  	    if (_T) i3c_master_dma_unmap_single(_T))
>
> +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> +			    struct i3c_ccc_cmd *cmd);
> +
> +int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				const struct i3c_ccc_cmd *cmd);
> +
> +int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				u8 old_dyn_addr);
> +int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
> +				     struct i3c_dev_desc *dev);
> +void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev);
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
>
> --
> 2.25.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
